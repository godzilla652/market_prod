class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  layout 'astra'

  # GET /contracts
  # GET /contracts.json
  def index
    @q = Contract.where(status: :pending).search(params[:q])
    @contracts = @q.result(distinct: true)
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    redirect_to 'https://astra-management.ca/contractor.html'
  end

  # GET /contracts/new
  def new
    @contract = Contract.new
    @contract.build_mailing_address
    @contract.build_remittance_address

  end

  # GET /contracts/1/edit
  def edit
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(contract_params)

    respond_to do |format|
      if @contract.save
        if params[:contract][:type_work].present?
          team = false
          if params[:contract][:type_work].include? 'Astra Project Manager'
            team = true
          end
          @contract.update(type_work: params[:contract][:type_work].join(", "), team: team,
                           city: params[:contract][:city].join(", "))
        end
        team = if @contract.team?
                 true
               else
                 false
               end
        UserMailer.welcome_email(@contract.email, team).deliver if @contract.email.include? "@"
        UserMailer.welcome_email_admin(Settings['email.sender'], @contract.id).deliver if @contract.present?
        format.html { redirect_to 'https://astra-management.ca/success.html' }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1
  # PATCH/PUT /contracts/1.json
  def update

    respond_to do |format|
      if @contract.update(contract_params)
        @contract.update(type_work: params[:contract][:type_work].join(", "))
        format.html { redirect_to @contract, notice: 'Contract was successfully updated.' }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract.destroy
    respond_to do |format|
      format.html { redirect_to contracts_url, notice: 'Contract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contract
    @contract = Contract.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contract_params
    params.require(:contract).permit(:id, :sin, :team, {city: []}, :user_id, :contractor_name, {type_work: []}, :legal_title, :mailing_address_id,
                                     :remittance_address_id, :contact_name, :email, :password, :telephone, :bussines_bil_req_phone, :bussines_serv_req_phone, :gst, :authority_person_name,
                                     :authority_person_phone, :serv_req_name, :serv_req_email, :serv_req_phone, :bil_req_name, :bil_req_email,
                                     :bil_req_phone, :full_name, :title, :date_submitted, :status, :check_sub, :check_fin, :check_sert, :check_ins,
                                     :check_bus, :check_bond, :check_cont, :check_work, :check_exp,
                                     mailing_address_attributes: [:id, :street, :city, :province,
                                                                  :postal_code], remittance_address_attributes: [:id, :street, :city, :province,
                                                                                                                 :postal_code], business_attributes: [:type_one, :date_corporation, :name, :number_employees, :union_affiliated,
                                                                                                                                                      :union_text, :addressc_id, :contract_id, :name_p, :name_sp, :date_corporation_p, business_partners_attributes: [:id, :name, :business_id, :addressc_id,
                                                                                                                                                                                                                                                                      addressc_attributes: [:id, :street, :city, :province, :postal_code]],
                                                                                                                                                      addressc_attributes: [:id, :street, :city, :province, :postal_code]], financial_attributes: [:id, :contract_id,
                                                                                                                                                                                                                                                   :bank, :addressc, :contact, :phone, :email, :acct, :transist, :institution, :bonding_company, :bc_n_a, :bc_limit, :bc_address,
                                                                                                                                                                                                                                                   :bc_contact, :bc_phone, :bc_email, :insurance_company, :ic_address, :ic_general_laibility, :ic_expiry, :ic_phone, :ic_email,
                                                                                                                                                                                                                                                   :ic_wcb, :other_work_astra, :void_check, :ins_cert, :wcb_cert, :void_check_remote_url, :ins_cert_remote_url, :wcb_cert_remote_url, :other_property_name, :other_property_address, :other_contact, :other_phone, :other_phone_alt,
                                                                                                                                                                                                                                                   trades_attributes: [:id, :name, :range, :financial_id]], projects_attributes: [:id, :check_past, :description, :year_completion, :value,
                                                                                                                                                                                                                                                                                                                                  :owner_name, :project_address_id, :owner_contact_one, :phone_one, :email_one, :owner_contact_two, :consultant_two, :phone_two,
                                                                                                                                                                                                                                                                                                                                  :email_two, :contract_id, project_address_attributes: [:id, :street, :city, :province, :postal_code]])
  end
end
