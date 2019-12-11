class CreateTaskSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :task_suggestions do |t|
      t.integer :user_id
      t.integer :task_id
      t.text :proposed_text
    end
  end
end
