class AddApartmentColumnToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :apartment, :string, default: ''
  end
end
