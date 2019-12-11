class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer :owner_id
      t.integer :concierge_id
      t.string :title
      t.string :status
      t.string :type
      t.text :description
      t.string :country
      t.string :city
      t.string :street
      t.string :phone
      t.integer :budget
      t.datetime :date_limit
      
      t.timestamps
    end
  end
end
