module Contractable
  class ApproveContract

    include Interactor

    delegate :contract, to: :context

    def call
      contract.update status: 'approved'
      context.user = create_user_web

      if context.user.valid?
        UserMailer.createuser_email(context.user, contract.password).deliver
      else
        context.fail! error: context.user.errors.full_messages
      end
    end

    private

    def create_user_web
      user = User.find_by_email(contract.email)
      user.present? ? set_user_id(user) : create_user
    end

    def user_params
      {
        email: contract.email,
        password: contract.password,
        first_name: contract.contact_name,
        phone1: contract.telephone,
        street: contract.mailing_address.street,
        city: contract.mailing_address.city,
        postal_code: contract.mailing_address.postal_code,
        photo: context.params[:contract][:photo]
      }
    end

    def set_user_id(user)
      # contract.update user_id: user.id
      # user.update password: contract.password
      # return user
      context.fail! error: ['such user already exists']
    end

    def create_user
      user = User.create user_params
      contract.update user_id: user.id
      return user
    end

  end
end
