class AddTypecToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :typec, :string
  end
end
