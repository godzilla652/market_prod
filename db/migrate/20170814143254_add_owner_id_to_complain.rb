class AddOwnerIdToComplain < ActiveRecord::Migration[5.0]
  def change
    add_column :complaints, :owner_id, :integer
    add_column :users, :blocked_to, :datetime
  end
end
