class AddCheckfieldToContracts < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :check_sub, :boolean
    add_column :contracts, :check_fin, :boolean
    add_column :contracts, :check_sert, :boolean
    add_column :contracts, :check_ins, :boolean
    add_column :contracts, :check_bus, :boolean
    add_column :contracts, :check_bond, :boolean
    add_column :contracts, :check_cont, :boolean
    add_column :contracts, :check_work, :boolean
    add_column :contracts, :check_exp, :boolean
  end
end
