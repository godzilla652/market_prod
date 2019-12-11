class Role < ApplicationRecord

  # after_create :recreate_permissions

  has_many :users, dependent: :nullify
  has_many :permissions, dependent: :destroy

  belongs_to :resource,
             polymorphic: true,
             optional: true

  validates :name, uniqueness: true

  accepts_nested_attributes_for :permissions

  def self.by_name(name)
    find_by! name: name.to_s
  end

  def recreate_permissions
    PermissionsConstants::MODELS.each do |model|
      PermissionsConstants::GENERAL_PERMISSIONS.each do |action|
        next if PermissionsConstants::ONLY_READ_MODELS.include?(model) && action == 'manage_access'
        a = Permission.where(subject_class: (model.name rescue model), role_id: id, action: action).first_or_initialize
        a.update active: false if a.new_record?
      end
    end
  end

end
