class AddOrderToBit < ActiveRecord::Migration[5.0]
  def change
    add_column :task_suggestions, :order, :integer
  end
end
