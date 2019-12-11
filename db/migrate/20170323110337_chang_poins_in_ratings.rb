class ChangPoinsInRatings < ActiveRecord::Migration[5.0]
  def change
    change_column :ratings, :points, :integer
  end
end
