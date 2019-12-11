class Admin::LineTasksController < Admin::AdminController
  before_action :set_line_task, only: [:show, :edit, :update, :destroy]

  def index
    @q = LineTask.search(params[:q])
    @line_tasks = @q.result(distinct: true)

  end

  def show
  end

  def new
    @line_task = LineTask.new
  end

  def edit
  end

  def create
    @line_task = LineTask.new(line_task_params)

    respond_to do |format|
      if @line_task.save
        format.html { redirect_to redirect_link(@line_task.task_id), notice: 'Project task was successfully created.' }
        format.json { render :show, status: :created, location: @line_task }
      else
        format.html { render :new }
        format.json { render json: @line_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @line_task.update(line_task_params)
        format.html { redirect_to redirect_link(@line_task.task_id), notice: 'Project task was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_task }
      else
        format.html { render :edit }
        format.json { render json: @line_task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    id = @line_task.task_id
    @line_task.destroy
    respond_to do |format|
      format.html { redirect_to redirect_link(id), notice: 'Project task was successfully destroyed.' }
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
  def set_line_task
    @line_task = LineTask.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def line_task_params
    params.require(:line_task).permit(:title, :budget, :type_line, :status, :task_id)
  end

  def redirect_link(id)
    if URI(request.referer || '').to_s.match(/edit\z/)
      edit_admin_task_url(id)
    else
      admin_task_url(id)
    end
  end
end
