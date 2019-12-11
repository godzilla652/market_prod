class CustomSessionsController < Devise::SessionsController
  before_action :before_login, only: :create
  after_action :after_login, only: :create

  def before_login
  end

  def after_login
    @access_token = Oauth::AccessToken.create(application_id: application.id, resource_owner_id: current_user.id, token: current_user.generate_jwt_token)
    current_user.update(is_logged_in: true, token_web: @access_token.token)
  end

  def destroy
    token = current_user.token_web
    if token != '' || token != nil
      a_token = Oauth::AccessToken.find_by(token: token, resource_owner_id: current_user.id)
      if a_token.present?
        a_token.destroy
      end
      current_user.update(is_logged_in: false, token_web: nil)
    end
    super
  end

  private

  def application
    application = Oauth::Application.last
    application
  end

end
