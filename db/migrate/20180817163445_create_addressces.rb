class CreateAddressces < ActiveRecord::Migration[5.0]
  def change
    create_table :addresscs do |t|
      t.string :street
      t.string :city
      t.string :province
      t.string :postal_code

      t.timestamps
    end
  end
end
