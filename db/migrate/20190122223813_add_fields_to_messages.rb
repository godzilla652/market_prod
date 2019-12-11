class AddFieldsToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :id_line_task, :integer
    add_column :messages, :title, :string
    add_column :messages, :budget, :integer
    add_column :messages, :type_line, :string
    add_column :messages, :status, :string
  end
end
