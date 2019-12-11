class CreateDialogs < ActiveRecord::Migration[5.0]
  def change
    create_table :dialogs do |t|
      t.integer :suggestion_id
      t.integer :hire_id
      t.integer :concierge_id
      t.integer :position

      t.timestamps
    end

    remove_column :task_suggestions, :order
  end
end
