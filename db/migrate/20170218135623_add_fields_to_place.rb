class AddFieldsToPlace < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :task_id, :integer
    add_column :places, :country_id, :integer
    add_column :places, :city, :string
    add_column :places, :street, :string
  end
end
