class AddTasksPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :task_payments do |t|
      t.integer :task_id
      t.integer :user_id
      t.boolean :hire
      t.boolean :concierge
      t.integer :budget
      t.float :persents

      t.timestamps  null: false
    end
  end
end
