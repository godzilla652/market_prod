class ChangeBudgets < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :budget, :float
    change_column :task_payments, :budget, :float
  end
end
