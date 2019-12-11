class AddTaskIdToComplaaint < ActiveRecord::Migration[5.0]
  def change
    add_column :complaints, :task_id, :integer
  end
end
