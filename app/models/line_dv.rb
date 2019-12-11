class LineDv < ApplicationRecord
  belongs_to :display_view
  belongs_to :line_dv, optional: true
  has_many :line_dvs
  has_many :item_line_dvs
  scope :root_line_dvs, -> {where(line_dv_id: nil)}

end
