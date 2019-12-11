class CreateFinancials < ActiveRecord::Migration[5.0]
  def change
    create_table :financials do |t|
      t.references :contract, foreign_key: true
      t.string :bank
      t.string :addressc
      t.string :contact
      t.string :phone
      t.string :email
      t.string :acct
      t.string :transist
      t.string :institution
      t.string :bonding_company
      t.string :bc_limit
      t.string :bc_address
      t.string :bc_contact
      t.string :bc_phone
      t.string :bc_email
      t.string :insurance_company
      t.string :ic_address
      t.string :ic_general_laibility
      t.date :ic_expiry
      t.date :ic_phone
      t.string :ic_email
      t.string :ic_wcb
      t.boolean :other_work_astra
      t.string :other_property_name
      t.string :other_property_address
      t.string :other_contact
      t.string :other_phone
      t.string :other_phone_alt

      t.timestamps
    end
  end
end
