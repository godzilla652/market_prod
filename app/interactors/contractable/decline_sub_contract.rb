module Contractable
  class DeclineSubContract

    include Interactor

    delegate :contract, to: :context

    def call
      return if !contract.sub_contract.present?

      sub_contract = contract.sub_contract
      sub_contract.update(status: 'archive')
      cause = 'THIS IS MESSAGE'
      UserMailer.declineuser2_email(sub_contract, sub_contract.email, cause).deliver if sub_contract.email.present?
      sub_contract.user.update(blocked_to: Time.now + 10.year) if sub_contract.user.present?
    end

  end
end
