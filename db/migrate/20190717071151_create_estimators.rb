class CreateEstimators < ActiveRecord::Migration[5.2]
  def change
    create_table :estimators do |t|
      t.string :city
      t.string :address
      t.integer :sqft
      t.integer :stair
      t.integer :door
      t.integer :closet_door
      t.integer :light
      t.integer :receptacle
      t.boolean :new_kitch
      t.boolean :paint_new_kitch
      t.boolean :surround
      t.boolean :vanity
      t.boolean :toilet
      t.boolean :accessory
      t.boolean :cleanfinal, default: true
      t.string :name
      t.string :phone
      t.string :email
      t.text :comment

      t.timestamps
    end
  end
end
