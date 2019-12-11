class CreateLineTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :line_tasks do |t|
      t.string :title
      t.integer :budget
      t.string :type_line
      t.string :status
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
