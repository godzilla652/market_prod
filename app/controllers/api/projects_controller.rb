class Api::ProjectsController < Api::ApiController

  def index
    @entities = ProjectTask.where(active: true)
  end

  def show
    @entity = ProjectTask.find(params[:id])
    @entities = @entity.tasks
  end
end

