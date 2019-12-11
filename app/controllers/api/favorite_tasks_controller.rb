class Api::FavoriteTasksController < Api::ApiController

  def index
    ids = FavoriteTask.where(user_id: current_resource_owner.id).pluck(:task_id).uniq
    ids = ids.blank? ? [0] : ids
    @q = Task.search(id_in: ids)
    @entities = @q.result.order(id: :desc).page(params[:page]).per(params[:per_page])
    render 'api/tasks/index'
  end

  def create
    @entity = FavoriteTask.new(favorite_task_params)

    if @entity.save
      #return head :ok, status: 200
      index
    else
      respond_with @entity
    end
  end

  def destroy
    @entity = FavoriteTask.where(task_id: params[:id]).first

    if @entity.destroy
      #render 'api/tasks/index'
      index
    end
  end

  private

  def favorite_task_params
    params.permit().tap do |param|
      param[:user] = current_resource_owner
      param[:task_id] = params[:id]
    end
  end
end
