class BusinessPartner < ApplicationRecord
  belongs_to :addressc, optional: true
  belongs_to :business, optional: true
  accepts_nested_attributes_for :addressc

  def views_address
    "#{addressc.street} #{addressc.city} #{addressc.postal_code} #{addressc.province}"
  end

end
