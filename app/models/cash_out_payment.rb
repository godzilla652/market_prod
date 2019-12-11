require 'paypal-sdk-permissions'
require 'securerandom'
require 'paypal-sdk-rest'

require 'stripe'

include PayPal::SDK::REST

class CashOutPayment < ApplicationRecord
  belongs_to :user, optional: true


  def pay_pal?
    self.pay_system == 'pay_pal'
  end

  def stripe?
    self.pay_system == 'stripe'
  end

  def pay_pal_payout
    @payout = Payout.new({
                             :sender_batch_header => {
                                 :sender_batch_id => SecureRandom.hex(8),
                                 :email_subject => 'You have a Payout!'
                             },
                             :items => [
                                 {
                                     :recipient_type => 'EMAIL',
                                     :amount => {
                                         :value => self.amount,
                                         :currency => 'CAD'
                                     },
                                     :note => 'Thanks for your patronage!',
                                     :receiver => self.ppal_email
                                 }
                             ]
                         })

    begin
      @payout_batch = @payout.create
      logger.info "Created Payout with [#{@payout_batch.batch_header.payout_batch_id}]"
      unless @payout_batch.batch_header.payout_batch_id.nil?
        self.update_attribute(:apply, DateTime.now)
      end
    rescue ResourceNotFound => err
      logger.error @payout.error.inspect
    end
  end

  def stripe_payout
    #Stripe.api_key = "sk_live_kstbHmAuBwJn64KNRC5zSfkc" #live

    # Stripe.api_key = "sk_test_1LQjcaCHUTv3JEwG4vwCh4Dq" #test
    #
    # payout = Stripe::Payout.create({
    #   :amount => (self.amount).to_i*100,
    #   :currency => "cad",
    #   :statement_descriptor => self.card_number
    # })
    #
    # unless payout.id.nil?
    self.update_attribute(:apply, DateTime.now)
    # end
  end
end
