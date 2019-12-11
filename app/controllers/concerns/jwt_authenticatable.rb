module JwtAuthenticatable

  extend ActiveSupport::Concern

  def api_current_user
    @current_user ||= detect_user_from_jwt
  end

  private

  def current_user_id
    decoded_jwt_token[0]['sub']
  end

  def decoded_jwt_token
    JWT.decode jwt_token, Settings.jwt_secret
  end

  def detect_user_from_jwt
    User.find current_user_id rescue nil
  end

  def jwt_token
    request.headers['Authorization'].split(' ').last
  end

end
