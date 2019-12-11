class AddSuggestIdToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :suggestion_id, :integer
  end
end
