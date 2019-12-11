class CreateUserPendingTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :users_pendings_tasks do |t|
      t.integer :user_id
      t.integer :task_id
      t.integer :position

      t.timestamps
    end
  end
end
