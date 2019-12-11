module Contractable
  class UpdateContract

    include Interactor

    delegate :params, to: :context

    def call
      contract.update permitted_params
      contract.user.update photo: params[:contract][:photo] if params[:contract][:photo].present?
      contract.user.update password: params[:contract][:password] if params[:contract][:password].present?
      context.contract = contract
    end

    private

    def permitted_params
      params.require(:contract).permit :contact_name, :email, :password, :telephone, :authority_person_name, :authority_person_phone,
                                       :team, mailing_address_attributes: [:street, :city, :province, :postal_code]
    end

    def contract
      @_contract ||= Contract.find params[:id]
    end

  end
end
