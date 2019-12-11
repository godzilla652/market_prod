class AddPointToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :points, :float
  end
end
