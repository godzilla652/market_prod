class RemoveUserIdFromRatings < ActiveRecord::Migration[5.0]
  def change
    remove_column :ratings, :user_id
  end
end
