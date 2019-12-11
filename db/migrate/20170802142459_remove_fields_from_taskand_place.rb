class RemoveFieldsFromTaskandPlace < ActiveRecord::Migration[5.0]
  def change
    remove_column :places, :street, :country_id, :city
    add_column :places, :address, :text
  end
end
