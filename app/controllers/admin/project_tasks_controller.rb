class Admin::ProjectTasksController < Admin::AdminController
  before_action :set_project_task, only: [:show, :edit, :update, :destroy]

  # load_and_authorize_resource
  # GET /project_tasks
  # GET /project_tasks.json
  def index
    authorize Project, :index?
    @q = ProjectTask.ransack(params[:q])
    @project_tasks = @q.result(distinct: true)
    @project_task = ProjectTask.new
  end


  # GET /project_tasks/1
  # GET /project_tasks/1.json
  def show
    authorize Project, :show?
    @gantt_data = GantDataService.call(@project_task)
  end

  # GET /project_tasks/new
  def new
    @project_task = ProjectTask.new
  end

  # GET /project_tasks/1/edit
  def edit
  end

  # POST /project_tasks
  # POST /project_tasks.json
  def create
    @project_task = ProjectTask.new(project_task_params)

    respond_to do |format|
      if @project_task.save
        format.html { redirect_to [:admin, @project_task], notice: 'Project task was successfully created.' }
        format.json { render :show, status: :created, location: @project_task }
      else
        format.html { render :new }
        format.json { render json: @project_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_tasks/1
  # PATCH/PUT /project_tasks/1.json
  def update
    respond_to do |format|
      if @project_task.update(project_task_params)
        format.html { redirect_to [:admin, @project_task], notice: 'Project task was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_task }
      else
        format.html { render :edit }
        format.json { render json: @project_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_tasks/1
  # DELETE /project_tasks/1.json
  def destroy
    @project_task.destroy
    respond_to do |format|
      format.html { redirect_to admin_project_tasks_url, notice: 'Project task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def search_params
    default_params = {}
    default_params.merge({user_id_eq: current_user.id}) if signed_in?
    # more logic here
    params[:q].merge(default_params)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_project_task
    @project_task = ProjectTask.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_task_params
    params.require(:project_task).permit(:name, :address, :type_pt, :description, :active, :number)
  end
end
