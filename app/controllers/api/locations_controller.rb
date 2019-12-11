class Api::LocationsController < Api::ApiController

  before_action :log

  def create
    use_case = Locationable::StoreCurrentLocation.call latitude: params[:latitude].to_f,
                                                       longitude: params[:longitude].to_f,
                                                       user: current_user

    render json: current_user.to_json(only: [:coordinates, :last_address, :coordinates_updated_at])
  end

  private

  def log
    formatted_time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    logger.debug "[#{formatted_time}] User: #{current_user&.id || 'not defined'}, params: #{params}, token: #{request.headers['Authorization']}"
  end

  def logger
    @logger ||= ActiveSupport::Logger.new("#{Rails.root}/log/tracker.log", 1, 50.megabytes)
  end

end
