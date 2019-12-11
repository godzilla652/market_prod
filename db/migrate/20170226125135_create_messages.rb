class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :author_id
      t.integer :recipient_id
      t.text :message_body

      t.timestamps
    end
  end
end
