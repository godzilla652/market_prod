class AddRoleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :role, foreign_key: true

    User.all.find_each do |user|
      user.update role_id: user.roles.first&.id
    end
  end
end
