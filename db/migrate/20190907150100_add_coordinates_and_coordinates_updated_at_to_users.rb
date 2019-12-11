class AddCoordinatesAndCoordinatesUpdatedAtToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :coordinates, :jsonb, default: {}
    add_column :users, :coordinates_updated_at, :datetime
    add_column :users, :last_address, :string
  end
end
