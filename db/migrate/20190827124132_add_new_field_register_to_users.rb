class AddNewFieldRegisterToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_logged_in, :boolean, default: false
    add_column :users, :token_web, :string
  end
end
