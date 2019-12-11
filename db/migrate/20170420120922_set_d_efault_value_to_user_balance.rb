class SetDEfaultValueToUserBalance < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :balance, :float, default: 0.0
  end
end
