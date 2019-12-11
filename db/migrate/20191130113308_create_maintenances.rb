class CreateMaintenances < ActiveRecord::Migration[5.2]
  def change
    create_table :maintenances do |t|
      t.string :title, limit: 25
      t.date :date
      t.references :vehicle
      t.boolean :done, default: false
      t.string :contractor_name

      t.timestamps
    end
  end
end
