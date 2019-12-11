class AddAuthorOfRating < ActiveRecord::Migration[5.0]
  def change
    rename_column :ratings, :user_id, :concierge_id
    add_column :ratings, :hire_id, :integer
  end
end
