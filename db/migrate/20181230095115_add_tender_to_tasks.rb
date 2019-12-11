class AddTenderToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :tender, :boolean
  end
end
