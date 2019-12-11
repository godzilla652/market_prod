class ChangeFeedNotifications < ActiveRecord::Migration[5.0]
  def change
    remove_column :feed_notifications, :entity_id
    add_column :feed_notifications, :task_id, :integer
    add_column :feed_notifications, :suggestion_id, :integer
  end
end
