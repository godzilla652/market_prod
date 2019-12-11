class EstimatorTypesController < ApplicationController
  before_action :set_estimator_type, only: :show
  before_action :verify_authenticity_token

  def show
    @estimator = Estimator.new
    @estimator_types = EstimatorType.active

  end

  def create
    @estimator = Estimator.new(estimator_params)

    respond_to do |format|
      @es_save = @estimator.save
      if @es_save
        @estimator.create_or_update_line(params[:estimator][:body])
        UserMailer.estimator_new(Settings['email.quota'], @estimator.id).deliver
        format.html { redirect_to estimator_type_url(@estimator.estimator_type), danger: 'rt' }
        format.json { render :show, status: :created, location: @estimator, danger: 'rt' }
      else
        format.html { render :new }
        format.json { render json: @estimator_type.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_estimator_type
    @estimator_type = EstimatorType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def estimator_type_params
    params.require(:estimator_type).permit(:name, :admin_descr, :active, :widget, :standard_field, :email)
  end

  def estimator_params
    params.require(:estimator).permit(:city, :address, :name, :phone, :email, :comment, :body,
                                      :status, :status_work, :archive, :work_order, :project_task_id,
                                      :supervisor_id, :estimator_type_id)
  end

end
