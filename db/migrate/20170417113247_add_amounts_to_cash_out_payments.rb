class AddAmountsToCashOutPayments < ActiveRecord::Migration[5.0]
  def change
    rename_table :cash_out_pauments, :cash_out_payments
    add_column :cash_out_payments, :amount, :float
    add_column :cash_out_payments, :percents, :float
  end
end
