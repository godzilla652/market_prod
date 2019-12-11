class RemovePolygonWzFromWorkZones < ActiveRecord::Migration[5.2]
  def change
    remove_index :work_zones, :polygon_wz
    remove_column :work_zones, :polygon_wz
  end
end
