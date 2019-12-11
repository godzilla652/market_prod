class AddSugIdFieldToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :suggestion_id, :integer
  end
end
