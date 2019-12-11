class DropTableLocationHires < ActiveRecord::Migration[5.2]
  def change
    drop_table :location_hires
  end
end
