class AddPayStateToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :pay_state, :string
  end
end
