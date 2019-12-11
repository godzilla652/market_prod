require 'statistics2'
require 'cmath'

#=============================
require 'paypal-sdk-permissions'
require 'securerandom'
require 'paypal-sdk-rest'

include PayPal::SDK::Core::Logging
include PayPal::SDK::OpenIDConnect
#=============================

class User < ApplicationRecord

  include JwtAuthenticable
  include Roleable

  # rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
  Paperclip::DataUriAdapter.register

  has_many :tasks, :class_name => "Task", :foreign_key => "owner_id", dependent: :destroy
  has_many :contasks, :class_name => "Task", :foreign_key => "concierge_id", dependent: :destroy
  has_many :payments, class_name: "TaskPayment", foreign_key: "user_id", dependent: :destroy #, :class_name => "Task", :foreign_key => "owner_id", dependent: :destroy
  has_many :favorite_tasks, dependent: :destroy
  has_many :pending_tasks, :class_name => "UsersPendingsTask", :foreign_key => "user_id", dependent: :destroy
  has_many :devices, class_name: 'Device', foreign_key: 'owner_id', dependent: :destroy
  has_many :complaints, dependent: :delete_all
  has_one :contract, dependent: :delete

  has_attached_file :photo, :styles => {:medium => "300x300>", :thumb => "100x100>", :big => "1280x1280>"}
  validates_attachment :photo, :content_type => {:content_type => ["image/jpeg", "image/gif", "image/png"]},
                       :size => {:in => 0..10.megabytes}

  before_save :default_first_name
  before_save :default_last_name

  scope :filter_by, ->(type_work) { joins(:contract).where('contracts.type_work ~ ?', type_work.split(/\W+/).join('.*')) }

  accepts_nested_attributes_for :role
  accepts_nested_attributes_for :contract

  def to_s
    [full_name || email, id].join ', '
  end

  def photo_data=(data_value)
    StringIO.open(Base64.strict_decode64(data_value)) do |data|
      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = "temp#{DateTime.now.to_i}.png"
      data.content_type = "image/png"
      self.photo = data
    end
  end

  def default_first_name
    self.first_name ||= ''
  end

  def default_last_name
    self.last_name ||= ''
  end

  def first_suggesion?(task_id)
    TaskSuggestion.where(user_id: self.id, task_id: task_id).exists?
  end

  def deals(role)
    task_role = role.eql?('hire') ? :owner_id : :concierge_id
    Task.where(["#{task_role} = ? and status = ?", self.id, 'done_confirmed']).count
  end

  def rating(role)
    role_id = role.eql?('hire') ? 'hire_id' : 'concierge_id'
    role_name = role.eql?('hire') ? 'concierge' : 'hire'
    points = Rating.where("#{role_id} = #{self.id} AND #{role_name} = true").pluck(:points)
    count = points.count
    result = points.any? ? points.sum.to_f / count : 0
    val = result * 0.2
    val.round(1)
  end

  def ppal_email(authorization_code)
    tokeninfo = PayPal::SDK::OpenIDConnect::DataTypes::Tokeninfo.create(authorization_code)
    #access_token = tokeninfo.access_token
    userinfo = PayPal::SDK::OpenIDConnect::Userinfo.get(tokeninfo.access_token)
    userinfo.email
  end

  def stripe_payment?(stripe_token, budget = 0)

    budget = budget.eql?(0) ? (self.budget).to_i * 100 : (budget).to_i * 100

    begin
      Stripe.api_key = "sk_test_1LQjcaCHUTv3JEwG4vwCh4Dq" #test

      #Stripe.api_key = "sk_live_kstbHmAuBwJn64KNRC5zSfkc" #live

      charge = Stripe::Charge.create(
          :amount => budget,
          :currency => "cad",
          :description => "#{self.first_name} #{self.last_name}",
          :source => stripe_token,
      )
    rescue Stripe::StripeError => e
      if e.message
        return false
      end
    end
    return true
  end

  def total(role)
    if role.eql?('hire')
      prices = TaskPayment.where(user_id: self.id, hire: true).pluck(:budget).compact
      percentages = TaskPayment.where(user_id: self.id, hire: true).pluck(:persents).compact
      percentages_amount = percentages.any? ? percentages.sum : 0
      money = prices.any? ? prices.sum : 0

      money += percentages_amount
    else
      prices = TaskPayment.where(user_id: self.id, concierge: true).pluck(:budget).compact
      money = prices.any? ? prices.sum : 0
      #money += self.balance
    end
    money
  end

  def cash_out_amount
    cash = CashOutPayment.where(user_id: self.id).where.not(apply: nil).pluck(:amount).compact
    cash = cash.any? ? cash.sum : 0
    cash
  end

  def increase_balance(amount)
    self.update_attribute(:balance, self.balance + amount)
  end

  def self.get_by_fbtoken access_token

    conn = Faraday.new(:url => 'https://graph.facebook.com') do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end

    respond = conn.get '/v2.4/me', {:fields => 'id,email,first_name,last_name,hometown', :access_token => access_token}

    #raise ThirdSideError, "Errors receive data  from FB #{ActiveSupport::JSON.decode(respond.body)['error']['message']}" if respond.status != 200

    user_info = ActiveSupport::JSON.decode(respond.body)

    user = User.find_by(:facebook_id => user_info['id'])

    if user.nil?
      user = User.find_by(:email => user_info['email'])
    end

    if user.nil?

      user_params = {
          :email => user_info['email'],
          :first_name => user_info['first_name'],
          :last_name => user_info['last_name'],
          :facebook_id => user_info['id'],
          :facebook_token => access_token
      }

      user = User.new(user_params)
      user.save(validate: false)
    end

    if user.facebook_id.nil?
      user.update_attribute(:facebook_id, user_info['id'])
    end

    return user
  end

  def hire_unread_messages
    ids = Task.where(owner_id: self.id).pluck(:id)
    if ids.any?
      TaskSuggestion.where("task_id IN (#{ids.map(&:inspect).join(', ')}) AND hire_read = false").exists?
    end
  end

  def concierge_unread_messages
    TaskSuggestion.where(user_id: self.id, concierge_read: false).exists?
  end

  def full_name
    if contract.present?
      contract.contact_name
    else
      "#{self.first_name} #{self.last_name}"
    end
  end

  def legal_title
    contract&.legal_title
  end

  def coordinates
    CoordinatesObject.new(latitude: self["coordinates"]["latitude"], longitude: self["coordinates"]['longitude'])
  end

  def address_m
    [self.street, self.city, self.postal_code].select {|i| i.present? }.join ', '
  end

end
