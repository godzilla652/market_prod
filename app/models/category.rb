class Category < ApplicationRecord
  include RailsSortable::Model
  set_sortable :position
  scope :active, -> { where(active: true).group_by { |w| w.typec }.sort_by { |name, ar| name.downcase } }

  default_scope { order("position ASC") }

  has_many :equipments

end
