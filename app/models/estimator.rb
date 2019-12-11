class Estimator < ApplicationRecord
  belongs_to :supervisor, optional: true, :class_name => "User", :foreign_key => "supervisor_id"
  belongs_to :project_task, optional: true
  belongs_to :estimator_type
  has_many :fields, through: :estimator_type
  has_many :lines, class_name: 'LineEstimator', :foreign_key => "estimator_id" , dependent: :destroy

  scope :active, -> { where(status: true) }

  default_scope { order("created_at DESC") }

  STATUS_WORK = ['in progress', 'work assigned', 'complete']
  STATUS = ['pending', 'approved', 'finished', 'archive']

  def status_work_color
    case status_work
    when 'in progress'
      "td__inprogress"
    when 'work assigned'
      "td__work-assigned"
    when 'complete'
      "td__accept"
    end
  end

  def create_or_update_line(params)
    if params.present?
      fields.each do |field|
        mname = params[(field.depend.present? ? field.depend.machine_name : field.machine_name)]
        if mname.present?
          line = lines.find_or_initialize_by(field_estimator_id: field.id)
          line.value = set_line_value(params, field, mname)
          line.field_estimator_id = field.id
          line.estimator_id = id
          line.save
        end
      end
      scope = params['scope']
      if scope.present?
        scope.each do |field, array|
          scope_field = fields.find_by(machine_name: field)
          scope_field.depends.each do |dep|
            line = lines.find_or_initialize_by(field_estimator_id: dep.id)
            line.value = array.count
            line.field_estimator_id = dep.id
            line.estimator_id = id
            line.save
          end
          fields_scope = scope_field.field_estimators
          lines_scope = fields_scope.map{|e| lines.where(field_estimator_id: e.id)}
          lines_scope.map{|e| e.map{|r| r.destroy}} if array.count < (lines_scope.flatten.count/2)
          if scope_field
            ids = []
            array.each do |a|
              fields_scope.each do |field|
                value_param = a[field.machine_name]
                line = lines.where.not(id: ids).find_or_initialize_by(field_estimator_id: field.id)
                line.value = set_line_value(params, field, value_param)
                line.field_estimator_id = field.id
                line.estimator_id = id
                line.save
                ids << line.id
              end
            end
          end
        end
      end
      generate_files
    end
  end

  def set_line_value(params, field, mname)
    group_field = field.field_estimator
    if group_field.present?
      if group_field.type_field == 'scope_group'
        group_mname = params[field.field_estimator.machine_name]
        (group_mname == 'true' || group_mname == nil) ? mname : field.clear_value
      else
        group_mname = params[field.field_estimator.machine_name]
        (group_mname == 'true' || group_mname == nil) ? mname : field.clear_value
      end
    else
      mname
    end
  end

  # TODO rebase!!!!!!!! заменить на одну строку (line.value_calc) и все протестировать
  def body_qty_clear(line)
      value = body_value(line)
      if value == 'true'
        value = 1.00
      elsif value == 'false'
        value = 0.00
      end
      value
  end

  def body_value(line)
    line.value_calc
  rescue
    0.00
  end

  def total_price_field_clear(line, type)
      (type == 'trade') ? line.trade_total : line.astra_total
  end

  def rightleft(value)
    value == 'true' ? 'R/H' : 'L/H'
  end

  def order_total(type)
    lines.sum(type+'_total')
  end

  def total_five(type)
    (order_total(type) * 5) / 100
  end

  def full_total(type)
    order_total(type)+total_five(type)
  end

  def total_price_group_field_clear(f, type)
    line = lines.find_by(field_estimator_id: f)
    if line.present?
      (type == 'trade') ? line.trade_total : line.astra_total
    else
      0.00
    end
  end

  def check_depend_group(e, type)
    s = 0
    e.field_estimators.each do |f|
      if f.group?
        s += f.field_estimators.map{|e| total_price_group_field_clear(e, type)}.sum
      else
        s += total_price_group_field_clear(f.id, type)
      end
    end
    s
  end

  def full_group_total(type, group)
    if group.type_field.include? 'scope_group'
      field_ids = group.front_visible_child_fields.map{|e| e.id}
      col = lines.where(field_estimator_id: field_ids).each_slice(field_ids.count).count
      qua = group.astra_price*col
    else
      if group.field_estimators.present?
          group.field_estimators.each do |e|
            if e.group?
              qua = check_depend_group(e, type)
            else
              qua = total_price_group_field_clear(e, type)
            end
          end
        else
          qua = total_price_group_field_clear(group, type)
      end
    end
    qua
  end

  def number
      id
  end

  def scope_url
    "https://#{Rails.application.config.action_mailer.default_url_options[:host]}/estimator/scope_#{id}_#{address.gsub('/','').gsub(' ', "_")}.pdf"
  end

  def quote_url
    "https://#{Rails.application.config.action_mailer.default_url_options[:host]}/estimator/quote_#{id}_#{address.gsub('/','').gsub(' ','_')}.pdf"
  end

  def quote_comment_url
    "https://#{Rails.application.config.action_mailer.default_url_options[:host]}/estimator/quote_comment_#{id}_#{address.gsub('/','').gsub(' ','_')}.pdf"
  end

  def generate_files
    generate_pdf
    generate_comment
  end

  def generate_pdf
    Pdf::GeneratePdfBuilder.new(self).build!(self)
  end

  def generate_scope
    Pdf::GenerateScopeBuilder.new(self).build!(self)
  end

  def generate_comment
    Pdf::GenerateCommentEstimatorBuilder.new(self).build!(self)
  end

end
