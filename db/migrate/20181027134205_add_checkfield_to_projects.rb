class AddCheckfieldToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :check_past, :boolean
  end
end
