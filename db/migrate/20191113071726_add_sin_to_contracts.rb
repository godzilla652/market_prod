class AddSinToContracts < ActiveRecord::Migration[5.2]
  def change
    add_column :contracts, :sin, :string
  end
end
