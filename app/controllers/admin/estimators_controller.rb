class Admin::EstimatorsController < Admin::AdminController
  before_action :set_estimator, only: [:show, :edit, :update, :destroy, :status_change]
  skip_before_action :verify_authenticity_token

  # GET /estimators
  # GET /estimators.json
  def index
    authorize :Quote, :index?
    @q = Estimator.where(status: 'pending').search(params[:q])
    array_quote = @q.result(distinct: true)
    @estimators_count = array_quote.count
    @estimators = array_quote.group_by { |e| e.city }
    @supervisors = Contract.where(status: :approved, team: true).map{ |e| e.user }.map { |e| [e&.full_name, e&.id] }
    @projects = ProjectTask.all.map { |e| ["##{e.number} - #{e.name}", e.id] }
  end

  def estimators_approved
    authorize :Quote, :index?
    @q = Estimator.where(status: 'approved').search(params[:q])
    array_quote = @q.result(distinct: true)
    @estimators_count = Estimator.where(status: 'pending').count
    @estimators = array_quote.group_by { |e| e.city }
  end

  def estimators_finished
    authorize :Quote, :index?
    @q = Estimator.where(status: 'finished').search(params[:q])
    array_quote = @q.result(distinct: true)
    @estimators_count = array_quote.count
    @estimators = array_quote.group_by { |e| e.city }
  end

  def estimators_archive
    authorize :Quote, :index?
    @q = Estimator.where(status: 'archive').search(params[:q])
    array_quote = @q.result(distinct: true)
    @estimators_count = array_quote.count
    @estimators = array_quote.group_by { |e| e.city }
  end

  def status_change
    authorize :Quote, :update?
    if params[:work] == true
      @estimator.update(status_work: params[:status])
    else
      @estimator.update(status: params[:status])
      if params[:status] == 'approved'
        @estimator.generate_scope
      end
    end
    redirect_to '/admin/estimators_'+params[:url]
  end

  # GET /estimators/1
  # GET /estimators/1.json
  def show
    authorize :Quote, :show?
    @estimator_type = @estimator.estimator_type
    @lines = @estimator.lines
  end

  def generate_chs

  end

  # GET /estimators/new
  def new
    @estimator = Estimator.new
  end

  # GET /estimators/1/edit
  def edit
    @estimator_type = @estimator.estimator_type
  end

  # POST /estimators.json
  def create
    @estimator = Estimator.new(estimator_params)

    respond_to do |format|
      if @estimator.save
        @estimator.generate_comment
        if @estimator.type_estimator == 'Avenue Living'
          @estimator.generate_avenue
          #UserMailer.estimator_new(Settings['email.quota'], @estimator.id).deliver
        elsif @estimator.type_estimator == 'CHS'
          @estimator.update(body: params[:estimator][:body])
          @estimator.generate_chs
          #UserMailer.estimator_new(Settings['email.quota'], @estimator.id).deliver
        end
        format.html { redirect_to 'https://astra-management.ca/success.html' }
        format.json { render :show, status: :created, location: @estimator }
      else
        format.html { render :new }
        format.json { render json: @estimator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estimators/1
  # PATCH/PUT /estimators/1.json
  def update
    respond_to do |format|
      if @estimator.update(estimator_params)
        #@estimator.update(body: params[:estimator][:body]) unless params[:estimator][:body].nil?
        @estimator.create_or_update_line(params[:estimator][:body])
        @estimator.generate_files
        if params[:estimator][:status] == 'approved'
          @estimator.generate_scope
        end
        if params[:estimator][:url] == 'pending'
          format.html { redirect_to admin_estimators_url, notice: 'Estimator was successfully updated.' }
        else
          format.html { redirect_to edit_admin_estimator_url(@estimator), notice: 'Estimator was successfully updated.' }
        end
        format.json { render :show, status: :ok, location: @estimator }
      else
        format.html { render :edit }
        format.json { render json: @estimator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estimators/1
  # DELETE /estimators/1.json
  def destroy
    @estimator.destroy
    respond_to do |format|
      format.html { redirect_to admin_estimators_url, notice: 'Estimator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_estimator
    @estimator = Estimator.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def estimator_params
    params.require(:estimator).permit(:city, :address, :name, :phone, :email, :comment, :body,
                                      :status, :status_work, :archive, :work_order, :project_task_id,
                                      :supervisor_id, :estimator_type_id, :status, :status_work)
  end
end
