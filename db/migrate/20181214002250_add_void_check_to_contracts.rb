class AddVoidCheckToContracts < ActiveRecord::Migration[5.0]
  def up
    add_attachment :financials, :void_check
  end

  def down
    remove_attachment :financials, :void_check
  end
end
