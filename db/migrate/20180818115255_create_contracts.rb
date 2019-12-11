class CreateContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :contracts do |t|
      t.string :contractor_name
      t.string :type_work
      t.string :legal_title
      t.integer :mailing_address_id
      t.integer :remittance_address_id
      t.string :contact_name
      t.string :email
      t.string :password
      t.string :telephone
      t.string :gst
      t.string :authority_person_name
      t.string :authority_person_phone
      t.string :serv_req_name
      t.string :serv_req_email
      t.string :serv_req_phone
      t.string :bil_req_name
      t.string :bil_req_email
      t.string :bil_req_phone
      t.string :full_name
      t.string :title
      t.date :date_submitted

      t.timestamps
    end
  end
end
