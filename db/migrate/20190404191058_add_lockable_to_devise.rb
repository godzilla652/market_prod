class AddLockableToDevise < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :unlock_token, :string # Only if unlock strategy is :email or :both
    add_column :users, :locked_at, :datetime
    add_index :users, :unlock_token, unique: true
  end
end
