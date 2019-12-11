class AddRatingToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :rating, :boolean, null: false, default: false
  end
end
