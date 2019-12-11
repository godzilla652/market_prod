class DisplayView < ApplicationRecord
  belongs_to :viewable, polymorphic: true
  has_many :line_dvs
  has_many :item_line_dvs, through: :line_dvs
end
