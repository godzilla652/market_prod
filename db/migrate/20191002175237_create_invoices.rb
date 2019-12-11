class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :payable_type
      t.integer :payable_id
      t.string :state

      t.timestamps
    end
    add_index :invoices, [:payable_type, :payable_id], unique: true


    Task.all.find_each {|task| task.build_invoice.save }
  end
end
