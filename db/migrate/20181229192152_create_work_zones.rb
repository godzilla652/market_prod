class CreateWorkZones < ActiveRecord::Migration[5.0]
  def change
    create_table :work_zones do |t|
      t.string :name
      t.string :spot_one
      t.string :spot_two
      t.string :spot_three
      t.string :spot_four

      t.timestamps
    end
  end
end
