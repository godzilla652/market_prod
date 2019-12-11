class CreateWorkZoneVisitLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :work_zone_visit_logs do |t|
      t.references :user, foreign_key: true
      t.references :work_zone, foreign_key: true
      t.datetime :time_from
      t.datetime :time_to

      t.timestamps
    end
  end
end
