class AddTypeMessageToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :type_message, :string
  end
end
