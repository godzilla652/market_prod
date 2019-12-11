class AddLatitudeAndLongitudeToPlace < ActiveRecord::Migration[5.0]
  def self.up
    add_column :places, :latitude, :float
    add_column :places, :longitude, :float
    remove_column :tasks, :city
    remove_column :tasks, :street
    remove_column :tasks, :country
  end

  def self.down
    remove_column :places, :latitude
    remove_column :places, :longitude
  end
end
