class CreateComplaints < ActiveRecord::Migration[5.0]
  def change
    create_table :complaints do |t|
      t.integer :user_id
      t.string :complaint_types
      t.text :description

      t.timestamps
    end
  end
end
