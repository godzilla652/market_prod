class AaddUserIdFromRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :concierge_id, :integer 
  end
end
