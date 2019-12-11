class AddUniqueIndexToPermissions < ActiveRecord::Migration[5.2]
  def change

    add_index :permissions, [:role_id, :action, :subject_class], unique: true

  end
end
