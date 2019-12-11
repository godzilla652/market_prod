class CreateTaskImages < ActiveRecord::Migration[5.0]
  def change
    create_table :task_images do |t|
      t.integer :task_id
      t.attachment :photo

      t.timestamps
    end
  end
end
