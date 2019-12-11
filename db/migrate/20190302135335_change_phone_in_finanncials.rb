class ChangePhoneInFinanncials < ActiveRecord::Migration[5.0]
  def change
    remove_column :financials, :ic_phone
    add_column :financials, :ic_phone, :string

  end
end
