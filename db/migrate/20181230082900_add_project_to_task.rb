class AddProjectToTask < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :project_task, foreign_key: true
  end
end
