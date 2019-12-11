class Api::LineTasksController < Api::ApiController

  def show
    @entity = LineTask.find(params[:id])
  end

  def create
    @entity = LineTask.new(line_task_params_create)
    if @entity.save
      render 'api/tasks/show', object: @entity = @entity.task
    else
      render :json => {errors: {message: ['missing param: title']}}, :status => 500
    end
  end

  def update
    @entity = LineTask.find(params[:id])
    @entity.update(line_task_params)
    render 'api/tasks/show', object: @entity = @entity.task
  end

  def destroy
    @entity = LineTask.find(params[:id])
    task = @entity.task
    @entity.destroy
    render 'api/tasks/show', object: @entity = task
  end

  private

  def line_task_params_create
    params.require(:line_task).permit(:title, :budget, :type_line, :status, :task_id).tap do |param|
      param[:task_id] = params[:id]
    end
  end

  def line_task_params
    params.require(:line_task).permit(:title, :budget, :type_line, :status, :task_id)
  end

end
