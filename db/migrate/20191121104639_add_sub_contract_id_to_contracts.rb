class AddSubContractIdToContracts < ActiveRecord::Migration[5.2]
  def change
    add_column :contracts, :sub_contract_id, :integer
    add_index :contracts, :sub_contract_id
  end
end
