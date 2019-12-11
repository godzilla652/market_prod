class AddPolygonToLocationHires < ActiveRecord::Migration[5.0]
  def change
    # enable_extension 'postgis'
    add_column :work_zones, :polygon_wz, :text
    add_index :work_zones, :polygon_wz
  end
end
