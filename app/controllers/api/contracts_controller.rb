class Api::ContractsController < Api::ApiController

  def index
    @cat = Category.where(active: true)
    @contracts = Contract.where(status: 'approved', team: [nil, false])
  end

  def show
    contract = Contract.find params[:id]
    render json: {
      contact_name: contract.contact_name,
      email: contract.email,
      telephone: contract.telephone,
      mailing_address: {
        street: contract.mailing_address.street,
        city: contract.mailing_address.city,
        province: contract.mailing_address.province,
        postal_code: contract.mailing_address.postal_code
      },
      authority_person_name: contract.authority_person_name,
      authority_person_phone: contract.authority_person_phone
    }
  end


end
