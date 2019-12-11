class CreateItemLineDvs < ActiveRecord::Migration[5.2]
  def change
    create_table :item_line_dvs do |t|
      t.references :field_estimator, foreign_key: true
      t.references :line_dv, foreign_key: true

      t.timestamps
    end
  end
end
