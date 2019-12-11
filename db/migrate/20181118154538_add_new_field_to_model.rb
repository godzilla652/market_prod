class AddNewFieldToModel < ActiveRecord::Migration[5.0]
  def change
    add_column :contracts, :bussines_bil_req_phone, :string
    add_column :contracts, :bussines_serv_req_phone, :string
    add_column :financials, :bc_n_a, :boolean
    add_column :businesses, :name_p, :string
    add_column :businesses, :name_sp, :string
    add_column :businesses, :date_corporation_p, :date
  end
end
