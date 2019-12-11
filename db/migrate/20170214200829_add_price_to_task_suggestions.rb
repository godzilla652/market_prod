class AddPriceToTaskSuggestions < ActiveRecord::Migration[5.0]
  def change
    add_column :task_suggestions, :price, :integer
  end
end
