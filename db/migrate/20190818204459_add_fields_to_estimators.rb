class AddFieldsToEstimators < ActiveRecord::Migration[5.2]
  def change
    add_column :estimators, :work_order, :string
    add_reference :estimators, :project_task, foreign_key: true
    add_column :estimators, :supervisor_id, :integer, foreign_key: true
  end
end
