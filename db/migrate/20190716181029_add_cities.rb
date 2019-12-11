class AddCities < ActiveRecord::Migration[5.2]
  def change
    add_column :contracts, :city, :string
    add_column :tasks, :city, :string
  end
end
