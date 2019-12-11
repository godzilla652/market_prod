class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
     add_column :users, :first_name, :string
     add_column :users, :last_name, :string
     add_column :users, :street, :string
     add_column :users, :city, :string
     add_column :users, :postal_code, :string
     add_column :users, :phone1, :string
     add_column :users, :phone2, :string
  end
end
