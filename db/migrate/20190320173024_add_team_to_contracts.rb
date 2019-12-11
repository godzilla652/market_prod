class AddTeamToContracts < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :team, :boolean
  end
end
