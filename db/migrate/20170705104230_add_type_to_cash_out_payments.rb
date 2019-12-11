class AddTypeToCashOutPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :cash_out_payments, :pay_system, :string
  end
end
