class Business < ApplicationRecord
  belongs_to :addressc, optional: true
  belongs_to :contract, optional: true
  has_many :business_partners, dependent: :destroy
  accepts_nested_attributes_for :business_partners
  accepts_nested_attributes_for :addressc
  before_save :corp_set

  def corp_set
    type_one = 'Corporation' if (type_one.nil? || type_one == '')
  end

  def name_set
    case type_one
    when "Corporation"
      name
    when "Partnership"
      name_p
    when "SoleProprietor"
      name_sp
    end
  end

  def datecorp
    case type_one
    when "Corporation"
      date_corporation
    when "Partnership"
      date_corporation_p
    end
  end

  def views_address
    "#{addressc.street} #{addressc.city} #{addressc.postal_code} #{addressc.province}"
  end

end
