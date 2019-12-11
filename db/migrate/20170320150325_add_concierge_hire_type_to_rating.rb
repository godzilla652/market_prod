class AddConciergeHireTypeToRating < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :hire, :boolean, null: false, default: false
    add_column :ratings, :concierge, :boolean, null: false, default: false
  end
end
