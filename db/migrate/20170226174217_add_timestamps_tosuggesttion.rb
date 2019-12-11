class AddTimestampsTosuggesttion < ActiveRecord::Migration[5.0]
  def change
    add_column(:task_suggestions, :created_at, :datetime)
    add_column(:task_suggestions, :updated_at, :datetime)
  end
end
