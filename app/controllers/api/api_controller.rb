class Api::ApiController < ActionController::Base

  include JwtAuthenticatable
  include Pundit

  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  respond_to :json

  rescue_from Exception, :with => :handle_exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :current_user_set
  before_action :set_paper_trail_whodunnit

  before_action :set_format

  def user_not_authorized(e)
    render json: {
      message: e.to_s
    }, status: 403
  end

  def set_format
    request.format = 'json'
  end

  def set_locale
    logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"
    I18n.locale = extract_locale_from_accept_language_header
    logger.debug "* Locale set to '#{I18n.locale}'"
  end

  def current_user_set
    @current_user ||= api_current_user || warden.authenticate(scope: :user)
  end

  def current_user
    @current_user
  end

  # def resource_owner_authenticated?
  #   !doorkeeper_token.nil?
  # end

  def current_resource_owner
    # User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    current_user
  end

  def test
    render :plain => 'test text sample'
  end

  # def current_platform
  #   return doorkeeper_token.application.name unless doorkeeper_token.nil?

  #   app = Oauth::Application.where(
  #       :uid => params.require(:client_id),
  #       :secret => params.require(:client_secret)
  #   ).first

  #   return app.name unless app.nil?
  # end

  def handle_exception(exception)
    if exception.instance_of? ActionController::ParameterMissing
      return render json: {:errors => {:exception => [exception.message]}}, status: :bad_request
    end

    if exception.instance_of? ActiveRecord::RecordNotFound
      return render json: {:errors => {:exception => [exception.message]}}, status: :not_found
    end

    exception.message.slice! 'Validation failed:' if exception.message.include?('Validation failed:')

    logger.fatal "API EXCEPTION: #{exception.to_s} \n     #{exception.backtrace.join("\n     ")}"
    render json: {:errors => {:exception => [exception.message.strip]}}, status: :internal_server_error
  end

  private

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].present? ? request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first : 'ru'
  end

end
