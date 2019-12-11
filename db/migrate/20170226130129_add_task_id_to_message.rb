class AddTaskIdToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :task_id, :integer
  end
end
