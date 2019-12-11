class CreateFieldEstimators < ActiveRecord::Migration[5.2]
  def change
    create_table :field_estimators do |t|
      t.bigint  :fieldable_id
      t.string  :fieldable_type
      t.string :name
      t.string :name_scope
      t.string :machine_name
      t.boolean :active
      t.string :type_field
      t.text :desc
      t.decimal :default_value, precision: 19, scale: 2
      t.decimal :astra_price, precision: 19, scale: 2
      t.decimal :trade_price, precision: 19, scale: 2
      t.string :ancestry
      t.boolean :required
      t.boolean :multiple
      t.text :style_cls
      t.text :option

      t.timestamps
    end
    add_index :field_estimators, :ancestry
    add_index :field_estimators, [:fieldable_type, :fieldable_id]
  end
end
