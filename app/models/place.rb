class Place < ApplicationRecord

  belongs_to :task, optional: true #, dependent: :destroy
  belongs_to :country, optional: true

  geocoded_by :address
  after_validation :geocode

end
