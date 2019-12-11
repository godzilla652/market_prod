class AddPrestageToLineDvs < ActiveRecord::Migration[5.2]
  def change
    add_column :line_dvs, :prestage, :boolean
  end
end
