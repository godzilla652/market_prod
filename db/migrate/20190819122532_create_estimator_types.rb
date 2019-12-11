class CreateEstimatorTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :estimator_types do |t|
      t.string :name
      t.text :admin_descr
      t.boolean :active
      t.boolean :widget
      t.boolean :standard_field
      t.string :email

      t.timestamps
    end
  end
end
