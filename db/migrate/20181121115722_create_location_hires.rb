class CreateLocationHires < ActiveRecord::Migration[5.0]
  def change
    create_table :location_hires do |t|
      t.string :latitude
      t.string :longitude
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
