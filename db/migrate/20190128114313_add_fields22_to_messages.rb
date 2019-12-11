class AddFields22ToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :budget_task, :integer
    add_column :messages, :total, :decimal
  end
end
