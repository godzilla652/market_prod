class AddFBtokenToUser < ActiveRecord::Migration[5.0]
  def change
     add_column :users, :facebook_id, :string
     add_column :users, :facebook_token, :string
  end
end
