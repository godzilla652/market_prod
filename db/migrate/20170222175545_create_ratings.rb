class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :task_id
      t.float :points
      t.boolean :positive
      t.boolean :negative
    end
  end
end
