class CreateCashOutPauments < ActiveRecord::Migration[5.0]
  def change
    create_table :cash_out_pauments do |t|
      t.integer :user_id

      t.timestamp :apply
      t.timestamps
    end
  end
end
