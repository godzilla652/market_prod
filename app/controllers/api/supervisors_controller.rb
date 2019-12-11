class Api::SupervisorsController < Api::ApiController

  def index
    users = User.with_role(:hire)
    render json: UserBlueprint.render(users, view: :supervisor)
  end

end
