class RemoveBudgetFromTask < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :budget
  end
end
