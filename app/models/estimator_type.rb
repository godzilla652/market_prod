class EstimatorType < ApplicationRecord
  has_many :fields, as: :fieldable, class_name: 'FieldEstimator', dependent: :destroy
  has_many :estimators
  has_many :display_views, as: :viewable
  has_many :line_dvs, through: :display_views
  has_many :item_line_dvs, through: :line_dvs
  scope :active, -> {where(active: true)}

  after_save :create_admin_display_view

  def front_visible_root_fields
    fields.active.field_roots - fields.field_hide_front
  end

  def create_admin_display_view
    if self.admin_dv?
      DisplayView.create(name: name, viewable_id: id, viewable_type: 'EstimatorType') if display_views.empty?
    end
  end

  def self.import_all(json_string)
    #byebug
      json = JSON.parse(json_string)
      estimator = json["estimator_type"]
      fields = estimator['fields']
      type = EstimatorType.find_by_name(estimator["name"])
      if type.present?
          type.update(admin_descr: estimator["admin_descr"], active: estimator["admin_descr"], widget: estimator['widget'],
                      standard_field: estimator['standard_field'], email: estimator['email'])
      else
        type = EstimatorType.create(name: estimator["name"], admin_descr: estimator["admin_descr"], active: estimator["admin_descr"],
                    widget: estimator['widget'], standard_field: estimator['standard_field'], email: estimator['email'])
      end
      fields.each do |field|
        f = type.fields.find_by_machine_name(field['machine_name'])
        if f.present?
          f.update(fieldable_id: type.id, fieldable_type: field['fieldable_type'], name: field['name'], name_scope: field['name_scope'],
                   machine_name: field['machine_name'], active: field['active'], type_field: field['type_field'],
                   desc: field['desc'], default_value: field['default_value'].to_d, astra_price: field['astra_price'].to_d,
                   trade_price: field['trade_price'].to_d, ancestry: field['ancestry'], required: field['required'],
                   multiple: field['multiple'], style_cls: field['style_cls'], depend_id: field['depend_id'],
                   option: JSON.parse(field['option'].to_json), position: field['position'].to_i)
        else
          FieldEstimator.create(fieldable_id: type.id, fieldable_type: field['fieldable_type'], name: field['name'], name_scope: field['name_scope'],
                   machine_name: field['machine_name'], active: field['active'], type_field: field['type_field'],
                   desc: field['desc'], default_value: field['default_value'].to_d, astra_price: field['astra_price'].to_d,
                   trade_price: field['trade_price'].to_d, ancestry: field['ancestry'], required: field['required'],
                   multiple: field['multiple'], style_cls: field['style_cls'], depend_id: field['depend_id'],
                   option: JSON.parse(field['option'].to_json), position: field['position'].to_i)
        end
      end

  end

end
