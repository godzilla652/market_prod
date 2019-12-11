class ChangeSendInFeedNotifications < ActiveRecord::Migration[5.0]
  def change
    remove_column :feed_notifications, :send if column_exists?(:feed_notifications, :send)
  end
end
