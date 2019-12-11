class AddCardNumberToCashOutPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :cash_out_payments, :card_number, :string
  end
end
