class AddColumnsToFeedNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :feed_notifications, :task_title, :string
    add_column :feed_notifications, :message, :text
  end
end
