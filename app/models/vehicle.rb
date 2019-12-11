class Vehicle < ApplicationRecord
  has_one_attached :driver
  has_one_attached :passenger
  has_one_attached :front
  has_one_attached :rear

  has_one :assign, as: :assignable, dependent: :destroy
  has_one :contract, through: :assign
  has_many :maintenances

  scope :available, -> { where(added: false) }
  scope :added, -> { where(added: true) }

end
