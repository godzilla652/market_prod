class CreateLineEstimators < ActiveRecord::Migration[5.2]
  def change
    create_table :line_estimators do |t|
      t.string :value
      t.references :field_estimator, foreign_key: true
      t.references :estimator, foreign_key: true
      t.references :task, foreign_key: true
      t.decimal :astra_total
      t.decimal :trade_total

      t.timestamps
    end
  end
end
