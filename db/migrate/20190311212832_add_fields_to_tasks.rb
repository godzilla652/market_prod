class AddFieldsToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :date_start, :date
    add_column :tasks, :fact_start, :date
    add_column :tasks, :fact_end, :date
  end
end
