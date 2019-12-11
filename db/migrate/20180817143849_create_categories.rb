class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :position
      t.boolean :active

      t.timestamps
    end
  end
end
