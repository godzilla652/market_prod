module Contractable
  class CreateContract

    include Interactor

    delegate :params, to: :context

    def call
      contract = Contract.new permitted_params
      if contract.valid?
        contract.type_work = "Astra Project Manager"
        contract.save
        context.contract = contract
      else
        context.fail! error: contract.errors
      end
    end

    def rollback
      context.contract.destroy
    end

    private

    def permitted_params
      params.require(:contract).permit :sub_contract_id, :contact_name, :email, :password, :telephone, :authority_person_name, :authority_person_phone,
                                       :team, mailing_address_attributes: [:street, :city, :province, :postal_code]
    end

  end
end
