class CreatePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.string :action
      t.string :subject_class
      t.integer :subject_id
      t.boolean :active
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
