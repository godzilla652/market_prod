module Roleable

  extend ActiveSupport::Concern

  included do
    belongs_to :role, required: false
    has_many :permissions, through: :role
    has_and_belongs_to_many :roles, join_table: :users_roles

    def self.with_role(role_name)
      where role_id: Role.by_name(role_name).id
    end
  end

  def admin?
    has_role? :admin
  end

  def assign_role(role_name)
    update role_id: Role.by_name(role_name).id
  end

  def has_role?(role_name)
    if role_name == 'concierge'
      role&.name == role_name.to_s
    else
      true
    end
  end

end
