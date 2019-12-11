class AddTaskOwnerIdToFeedNotification < ActiveRecord::Migration[5.0]
  def change
    add_column :feed_notifications, :task_owner_id, :integer
  end
end
