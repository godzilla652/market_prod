module JwtAuthenticable

  extend ActiveSupport::Concern

  def generate_jwt_token(app = nil)
    JWT.encode payload(app), secret
  end

  private

  def payload(app)
    {
      sub: id,
      iat: Time.now.to_i,
      jti: SecureRandom.uuid,
      app_id: app&.id
    }
  end

  def secret
    Settings.jwt_secret
  end

end
