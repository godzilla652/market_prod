class CreateNotification < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :owner_id
      t.integer :user_id
      t.integer :entity_id
      t.string :notification_type

      t.timestamps
    end
  end
end
