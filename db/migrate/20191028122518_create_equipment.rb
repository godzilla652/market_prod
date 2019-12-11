class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :name
      t.references :category, foreign_key: true
      t.text :description
      t.integer :total_owned
      t.integer :available
      t.integer :assigned
      t.integer :damaged

      t.timestamps
    end
  end
end
