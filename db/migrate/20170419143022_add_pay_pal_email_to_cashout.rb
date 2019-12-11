class AddPayPalEmailToCashout < ActiveRecord::Migration[5.0]
  def change
    add_column :cash_out_payments, :ppal_email, :string
  end
end
