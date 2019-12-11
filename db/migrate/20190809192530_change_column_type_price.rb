class ChangeColumnTypePrice < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :budget, :decimal, precision: 19, scale: 2
    change_column :task_suggestions, :price, :decimal, precision: 19, scale: 2
    change_column :line_tasks, :budget, :decimal, precision: 19, scale: 2

  end
end
