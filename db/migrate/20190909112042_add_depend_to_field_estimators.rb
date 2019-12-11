class AddDependToFieldEstimators < ActiveRecord::Migration[5.2]
  def change
    add_column :field_estimators, :depend_id, :integer
    add_index :field_estimators, :depend_id
  end
end
