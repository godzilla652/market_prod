class AddDateToWorkZoneVisitLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :work_zone_visit_logs, :date, :date
  end
end
