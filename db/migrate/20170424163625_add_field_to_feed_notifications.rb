class AddFieldToFeedNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :feed_notifications, :send, :boolean, defaulf: false unless column_exists?(:feed_notifications, :send)
  end
end
