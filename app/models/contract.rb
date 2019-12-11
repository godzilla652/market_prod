class Contract < ApplicationRecord
  belongs_to :mailing_address, class_name: "Addressc", inverse_of: :contracts, optional: true
  belongs_to :remittance_address, class_name: "Addressc", inverse_of: :contracts, optional: true
  belongs_to :sub_contract, class_name: 'Contract', foreign_key: :sub_contract_id, optional: true
  has_one :business, dependent: :destroy
  has_one :financial, dependent: :destroy
  has_many :projects, dependent: :destroy
  belongs_to :user, optional: true
  has_many :contasks, through: :user
  has_many :tasks, through: :user
  has_many :vehicles, as: :assignable
  accepts_nested_attributes_for :mailing_address
  accepts_nested_attributes_for :remittance_address
  accepts_nested_attributes_for :business
  accepts_nested_attributes_for :financial
  accepts_nested_attributes_for :projects
  has_many :assigns
  has_many :vehicles, through: :assigns, source: :assignable, source_type: 'Vehicle'
  has_many :equipments, through: :assigns, source: :assignable, source_type: 'Equipment'

  after_destroy :destroy_user
  # before_update :change_user_name

  default_scope { order('created_at DESC') }
  scope :approved, -> { where(status: 'approved') }

  def destroy_user
    user&.contasks&.map(&:destroy)
    u = user
    if u.present?
      Contract.where(email: u.email).map { |e| e.update(user_id: nil) }
      u.destroy if user
    end
  end

  def gst_or_sin
    gst.present? ? gst : sin
  end

  def gst_percent
    gst.present? ? 5 : 0
  end

  def change_user_name
    user.update(email: email, first_name: contact_name, phone1: telephone) if user.present?
  end

  def new_change_status(par)
    update(status: par)
    if status == 'approved'
      if email.present? && password.present?
        create_user_web if email.include? '@'
        if user.present?
          UserMailer.createuser_email(user, password).deliver
          user.update(blocked_to: nil)
        end
      end
    elsif status == 'archive'
      if email.present? && password.present?
        UserMailer.declineuser_email(email).deliver if email.include? '@'

        user.update(blocked_to: Time.now + 10.year) if user.present?
      end
    end
  end

  def create_user_web
    us = User.find_by_email(email)
    if us.present?
      update(user_id: us.id)
      us.update(password: password)
    else
      us = User.create(email: email, password: password, first_name: contact_name, phone1: telephone,
                       street: mailing_address.street, city: mailing_address.city,
                       postal_code: mailing_address.postal_code)
      self.update(user_id: us.id)
      if self.team?
        us.assign_role :hire
      else
        us.assign_role :concierge
      end

    end
  end

  def views_mailing_address
    "#{mailing_address.street} #{mailing_address.city} #{mailing_address.postal_code} #{mailing_address.province}"
  end

  def self.cities_canada
    # [:ab, :bc, :mb, :nb, :nl, :ns, :nt, :nu, :on, :pe, :qc, :sk, :yt].map{|e| CS.get(:ca, e)}.flatten.sort
    # [:ab].map{|e| CS.get(:ca, e)}.flatten.sort
    ['Calgary',
     'Edmonton',
     'Lethbridge',
     'Red Deer',
     'Brooks',
     'Wetaskiwin',
     'Medicine Hat',
     'Camrose']
  end
end
