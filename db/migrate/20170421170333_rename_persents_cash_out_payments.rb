class RenamePersentsCashOutPayments < ActiveRecord::Migration[5.0]
  def change
    rename_column :cash_out_payments, :percents, :persents
  end
end
