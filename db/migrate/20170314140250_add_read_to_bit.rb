class AddReadToBit < ActiveRecord::Migration[5.0]
  def up
    add_column :task_suggestions, :hire_read, :boolean, :default => false
    add_column :task_suggestions, :concierge_read, :boolean, :default => true
  end

  def down
    remove_column :task_suggestions, :hire_read
    remove_column :task_suggestions, :concierge_read
  end
end
