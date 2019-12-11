class Addressc < ApplicationRecord
  has_many :contracts
  has_many :projects

  PROVINCES_LIST = ['Alberta', 'British Columbia', 'Manitoba', 'New Brunswick', 'Newfoundland and Labrador',
                    'Northwest Territories', 'Nova Scotia', 'Nunavut', 'Ontario', 'Prince Edward Island',
                    'Quebec', 'Saskatchewan', 'Yukon']

  def address_m
    "#{self.street self.city self.province self.postal_code}"
  end

  def to_s
    [street, city, province, postal_code].select {|i| i.present?}.join ', '
  end
end
