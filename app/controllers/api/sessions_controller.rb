class Api::SessionsController < Devise::SessionsController

  respond_to :json

  wrap_parameters :user, include: [:email, :password], format: [:json, :xml, :url_encoded_form, :multipart_form]

  def create
    if current_user

      app = Oauth::Application.where(uid: params[:client_id], secret: params[:client_secret]).first
      token = current_user.generate_jwt_token(app)

      render json: {
        access_token: token,
        token_type: 'Bearer',
        user: current_user.as_json
      }
    else
      render json: {
        errors: {
          email: ['Invalid email/password combination.']
        }
      }, status: 401
    end
  end

end
