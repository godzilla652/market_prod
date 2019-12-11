class FieldEstimator < ApplicationRecord
  include RailsSortable::Model
  set_sortable :position
  belongs_to :fieldable, polymorphic: true
  has_many :field_estimators
  belongs_to :field_estimator, optional: true
  belongs_to :depend, optional: true, class_name: 'FieldEstimator'
  has_many :depends, class_name: 'FieldEstimator', foreign_key: "depend_id"
  has_many :lines, class_name: 'LineEstimator', dependent: :destroy
  has_many :item_line_dvs, dependent: :destroy, dependent: :destroy
  #has_ancestry
  default_scope { order("position ASC") }
  scope :groups, -> {where(type_field: ['one_group','check_group', 'scope_group'])}
  scope :no_groups, -> {where.not(type_field: ['one_group','check_group', 'scope_group'])}
  scope :yes_scoupe_no_groups, -> {where.not(type_field: ['one_group','check_group'])}
  scope :calculation_dep, -> {where(type_field: ['yes_no_checkbox','one_checkbox', 'decimal', 'integer', 'scope_group'])}
  scope :field_roots, -> {where(field_estimator_id: nil)}
  scope :active, -> {where(active: true)}
  scope :field_roots_task_list, -> {where.not("option->>'hide_admin_list_task' = ?", "on")}
  scope :field_no_hide_pdf, -> {where.not("option->>'hide_pdf' = ?", "on")}
  scope :field_hide_front, -> {where("option->>'hide_front' = ?", "on")}
  enum typefield: {
      one_group: 'Group',
      check_group: 'Group (Yes/No)',
      decimal: 'Numerals',
      text: 'Text field',
      text_area: 'Text area',
      yes_no_checkbox: 'Yes/No radiobutton',
      one_checkbox: 'Yes (default)',
      right_left: 'R/H or L/H radiobuttons',
      two_num: '3/8 , 5/8',
      two_num_balk: '3/8 , 5/8, Balcony',
      scope_group: 'Height x Width',
      scope_group_two: 'Height x Width - 3/8 , 5/8',
      scope_group_three: 'Height x Width - 3/8 , 5/8, Balcony',
      scope_group_right_left: 'Height x Width - R/H or L/H',
  }
  enum calculations: {
      plus_type: 'Plus percent',
      plus_only: 'Additional Quantity',
      value_only: 'Only this value (Only radiobuttons)',
      add_each_to_addict: 'Additional qty to dependents fields for each unit',
      percent_only: 'Only percent'
  }
  before_save :auto_machine_name
  after_save :set_scope_field

  def set_scope_field
    if type_field.include? 'scope_group'
        height = field_estimators.search(machine_name_cont: 'height').result.take
        width = field_estimators.search(machine_name_cont: 'width').result.take
        FieldEstimator.create(fieldable_id: self.fieldable_id, fieldable_type: self.fieldable_type, name: "Height", name_scope: "Height",
                              machine_name: "height"+self.id.to_s, active: true, type_field: "text", multiple: true,
                              field_estimator_id: self.id, option: {"plus_value"=>"", "horizont_class"=>"on"}) unless height.present?
        FieldEstimator.create(fieldable_id: self.fieldable_id, fieldable_type: self.fieldable_type, name: "Width", name_scope: "Width",
                              machine_name: "width"+self.id.to_s, active: true, type_field: "text", multiple: true,
                              field_estimator_id: self.id, option: {"plus_value"=>"", "horizont_class"=>"on"}) unless width.present?
      case type_field
      when 'scope_group_two'
        two_num = field_estimators.find_by(type_field: 'two_num')
        unless two_num.present?
          field_estimators.where.not(type_field: 'text').map{|e| e.destroy}
          FieldEstimator.create(fieldable_id: self.fieldable_id, fieldable_type: self.fieldable_type, name: "Other", name_scope: "Other",
                                machine_name: "38_58"+self.id.to_s, active: true, type_field: "two_num", multiple: true,
                                field_estimator_id: self.id, option: {"plus_value"=>"", "horizont_class"=>"on"})
        end
      when 'scope_group_three'
        two_num_balk = field_estimators.find_by(type_field: 'two_num_balk')
        unless two_num_balk.present?
          field_estimators.where.not(type_field: 'text').map{|e| e.destroy}
          FieldEstimator.create(fieldable_id: self.fieldable_id, fieldable_type: self.fieldable_type, name: "Other", name_scope: "Other",
                                machine_name: "38_58_balc"+self.id.to_s, active: true, type_field: "two_num_balk", multiple: true,
                                field_estimator_id: self.id, option: {"plus_value"=>"", "horizont_class"=>"on"})
        end
      when 'scope_group_right_left'
        right_left = field_estimators.find_by(type_field: 'right_left')
        unless right_left.present?
          field_estimators.where.not(type_field: 'text').map{|e| e.destroy}
          FieldEstimator.create(fieldable_id: self.fieldable_id, fieldable_type: self.fieldable_type, name: "Other", name_scope: "Other",
                                machine_name: "right_left"+self.id.to_s, active: true, type_field: "right_left", multiple: true,
                                field_estimator_id: self.id, option: {"plus_value"=>"", "horizont_class"=>"on"})
        end
      end
    end
  end

  def dvname_dinamic
    dv_name.present? ? dv_name : name
  end

  def auto_machine_name
    (self.machine_name = name&.downcase.gsub(',', '').gsub('/', '').gsub(')', '').gsub('(', '').gsub('&', '').gsub('+', '').gsub(' ', '_').gsub('__', '_')) unless machine_name.present?
  end

  def front_visible_child_fields
    field_estimators.active - field_estimators.field_hide_front
  end

  def group?
    (type_field.include? 'one_group') || (type_field.include? 'check_group')
  end

  def clear_value
    field_estimator.type_field.match?(/one_checkbox|yes_no_checkbox/) ? 'false' : 0
  end

  def type_field_show
    FieldEstimator.typefields[type_field]
  end

  def v_option(value)
    option[value] if option.present?
  end

end
