class AddAppartmentToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :apartment, :string
  end
end
