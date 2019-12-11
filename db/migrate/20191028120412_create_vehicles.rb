class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :fleet
      t.integer :year
      t.string :make
      t.integer :km
      t.string :license
      t.bigint :assignable_id
      t.string :assignable_type
      t.date :since

      t.timestamps
    end
    add_index :vehicles, [:assignable_id, :assignable_type]
  end
end
