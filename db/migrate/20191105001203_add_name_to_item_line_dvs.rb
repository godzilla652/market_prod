class AddNameToItemLineDvs < ActiveRecord::Migration[5.2]
  def change
    add_column :item_line_dvs, :name, :string
  end
end
