class ChangeFeedsNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :feed_notifications, :sent, :integer, default: 0
  end
end
