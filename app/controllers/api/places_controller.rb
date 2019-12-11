class Api::PlacesController < Api::ApiController

  def index
    ids = Task.where.not(status: ['confirmed', 'done', 'done_confirmed']).where.not(owner_id: @current_user.id).pluck(:id)
    @entities = Place.where(task_id: ids)
  end

  def show
    @entity = Place.where(task_id: params[:id])
  end
end
