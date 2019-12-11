class ChangeCountryForUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :country_id, :integer, :default => 0, :null => false
  end
end
