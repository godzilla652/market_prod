class RemoveBudgetFromPayments < ActiveRecord::Migration[5.0]
  def change
    remove_column :task_payments, :budget
    add_column :task_payments, :budget, :float
  end
end
