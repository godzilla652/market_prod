class RenameNotifications < ActiveRecord::Migration[5.0]
  def change
    rename_table :notifications, :feed_notifications
  end
end
