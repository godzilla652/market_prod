class AddConfirmedAtTo < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :confirmed_at, :datetime
  end
end
