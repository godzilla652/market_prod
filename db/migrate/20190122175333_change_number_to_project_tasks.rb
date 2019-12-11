class ChangeNumberToProjectTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :project_tasks, :number
    add_column :project_tasks, :number, :integer
  end
end
