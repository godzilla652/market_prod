class CreateProjectTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :project_tasks do |t|
      t.string :name
      t.string :address
      t.string :type_pt
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
