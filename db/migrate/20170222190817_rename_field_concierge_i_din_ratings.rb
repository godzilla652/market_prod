class RenameFieldConciergeIDinRatings < ActiveRecord::Migration[5.0]
  def change
    rename_column :ratings, :concierge_id, :user_id
  end
end
