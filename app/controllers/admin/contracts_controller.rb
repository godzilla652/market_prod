class Admin::ContractsController < Admin::AdminController
  before_action :set_contract, only: %i[show edit update destroy new_change_status]
  #layout 'astra_admin'
  #load_and_authorize_resource :exept => [:new_change_status]

  # GET /contracts
  # GET /contracts.json
  def index
    authorize Contract, :index?
    @q = Contract.where(status: :pending, team: [nil, false]).search(params[:q])
    @contracts = @q.result(distinct: true)
  end

  def approved
    authorize Contract, :index?
    @q = Contract.where(status: :approved, team: [nil, false]).ransack(params[:q])
    @contracts = @q.result(distinct: true)
    respond_to do |format|
      format.html
    end
  end

  def archive
    authorize Contract, :index?
    @q = Contract.where(status: :archive, team: [nil, false]).ransack(params[:q])
    @contracts = @q.result(distinct: true)
    respond_to do |format|
      format.html
    end
  end

  def pending_team
    authorize :AstraTeam, :index?
    @q = Contract.where(status: :pending, team: true).search(params[:q])
    @contracts = @q.result(distinct: true)
  end

  def approved_team
    authorize :AstraTeam, :index?
    @q = Contract.where(status: :approved, team: true).ransack(params[:q])
    @contracts = @q.result(distinct: true)
    respond_to do |format|
      format.html
    end
  end

  def archive_team
    authorize :AstraTeam, :index?
    @q = Contract.where(status: :archive, team: true).ransack(params[:q])
    @contracts = @q.result(distinct: true)
    respond_to do |format|
      format.html
    end
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    if params[:cause].present?
      UserMailer.editcontr_email(@contract, @contract.email, params[:cause]).deliver if @contract.email.present?
      redirect_to admin_contract_url(@contract) + '?success=true'
    end
    respond_to do |format|
      format.html
      format.js {}
      format.json
    end
  end

  # GET /contracts/new
  def new
    @contract = Contract.new
    @contract.build_mailing_address
    @contract.build_remittance_address
    @contract.build_business
    @contract.build_financial
  end

  # GET /contracts/1/edit
  def edit
    @url_tabs = if @contract.status == 'pending'
                  if @contract.team?
                    'pending_team'
                  else
                    'contracts'
                  end
                elsif @contract.status == 'approved'
                  if @contract.team?
                    'approved_team'
                  else
                    'contracts'
                  end
                end
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(contract_params)

    respond_to do |format|
      if @contract.save
        @contract.update(type_work: params[:contract][:type_work].join(', ')) unless params[:contract][:type_work].nil?
        @contract.update(city: params[:contract][:city].join(', ')) unless params[:contract][:city].nil?
        @contract.new_change_status('approved')
        format.html { redirect_to '/admin/approved_team', notice: 'Contract was successfully created.' }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_change_status
    if params[:cause].present?
      @contract.update(status: 'archive')
      UserMailer.declineuser2_email(@contract, @contract.email, params[:cause]).deliver if @contract.email.present?
      redirect_to params[:url] + '?success=true'
      @contract.user.update(blocked_to: Time.now + 10.year) if @contract.user.present?
    else

      @contract.new_change_status(params[:status])
      redirect_to params[:url] + '?success=true'
    end

  end

  # PATCH/PUT /contracts/1
  # PATCH/PUT /contracts/1.json
  def update
    respond_to do |format|
      if @contract.update(contract_params)
        @contract.update(type_work: params[:contract][:type_work].join(', ')) unless params[:contract][:type_work].nil?
        @contract.update(city: params[:contract][:city].join(', ')) unless params[:contract][:city].nil?
        if @contract.user.present?
          @contract.user.update(email: @contract.email, first_name: @contract.contact_name, phone1: @contract.telephone,
                                street: @contract.mailing_address.street, city: @contract.mailing_address.city,
                                postal_code: @contract.mailing_address.postal_code)
        end
        format.html { redirect_to edit_admin_contract_path(@contract), notice: 'Contract was successfully updated.' }
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
    user = @contract.user
    @contract.destroy

    respond_to do |format|
      format.html { redirect_to admin_contracts_url, notice: 'Contract was successfully destroyed.' }
      user.destroy if user.present?
      format.json { head :no_content }
    end
  end

  def popup_new
    @contract = Contract.new
    @contract.build_mailing_address
  end

  def popup_create
    @use_case = Contractable::CreateUser.call params: params
  end

  def popup_update
    @use_case = Contractable::UpdateUser.call params: params
  end

  def popup_edit
    @contract = Contract.find params[:id]
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
                                     mailing_address_attributes: %i[id street city province
                                                                  postal_code], remittance_address_attributes: %i[id street city province
                                                                                                                 postal_code], business_attributes: [:id, :type_one, :date_corporation, :name, :number_employees, :union_affiliated,
                                                                                                                                                      :union_text, :addressc_id, :contract_id, :name_p, :name_sp, :date_corporation_p, business_partners_attributes: [:id, :name, :business_id, :addressc_id,
                                                                                                                                                                                                                                                                      addressc_attributes: %i[id street city province postal_code]],
                                                                                                                                                      addressc_attributes: %i[id street city province postal_code]], financial_attributes: [:id, :contract_id,
                                                                                                                                                                                                                                                   :bank, :addressc, :contact, :phone, :email, :acct, :transist, :institution, :bonding_company, :bc_n_a, :bc_limit, :bc_address,
                                                                                                                                                                                                                                                   :bc_contact, :bc_phone, :bc_email, :insurance_company, :ic_address, :ic_general_laibility, :ic_expiry, :ic_phone, :ic_email,
                                                                                                                                                                                                                                                   :ic_wcb, :other_work_astra, :void_check, :ins_cert, :wcb_cert, :void_check_remote_url, :ins_cert_remote_url, :wcb_cert_remote_url, :other_property_name, :other_property_address, :other_contact, :other_phone, :other_phone_alt,
                                                                                                                                                                                                                                                   trades_attributes: %i[id name range financial_id]], projects_attributes: [:id, :check_past, :description, :year_completion, :value,
                                                                                                                                                                                                                                                                                                                                  :owner_name, :project_address_id, :owner_contact_one, :phone_one, :email_one, :owner_contact_two, :consultant_two, :phone_two,
                                                                                                                                                                                                                                                                                                                                  :email_two, :contract_id, project_address_attributes: %i[id street city province postal_code]])
  end
end
