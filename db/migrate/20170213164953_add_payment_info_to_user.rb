class AddPaymentInfoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :cardholder_name, :string
    add_column :users, :card_number, :string
    add_column :users, :cvk, :integer
    add_column :users, :exp_month, :integer
    add_column :users, :exp_year, :integer
  end
end
