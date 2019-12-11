class Maintenance < ApplicationRecord
    # Maintenance

  belongs_to :vehicle

  validates :title, length: { maximum: 25 }
  validates :date, presence: true

  scope :is_progress, -> { where(done: false) }
  scope :is_done,     -> { where(done: true) }

end
