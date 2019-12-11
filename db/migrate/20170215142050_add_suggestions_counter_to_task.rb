class AddSuggestionsCounterToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :suggestions_counter, :integer
  end
end
