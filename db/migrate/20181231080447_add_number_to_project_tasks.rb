class AddNumberToProjectTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :project_tasks, :number, :string
  end
end
