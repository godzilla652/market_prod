# class Api::TokensController < Doorkeeper::ApplicationMetalController

#   def revoke
#     # The authorization server first validates the client credentials
#     if doorkeeper_token && doorkeeper_token.accessible?
#       # Doorkeeper does not use the token_type_hint logic described in the RFC 7009
#       # due to the refresh token implementation that is a field in the access token model.
#       revoke_token(doorkeeper_token.token)
#     end
#     if params.has_key?(:device)
#       device = Device.find_by(token: params[:device][:base_token])
#       unless device.nil?
#         device.destroy
#       end
#     end
#     if params[:web] == 'true'
#       if params[:user_email].present?
#         u = User.find_by_email(params[:user_email])
#         if u.present?
#           token = u.token_web
#           if token != '' || token != nil
#             a_token = Doorkeeper::AccessToken.find_by(token: token, resource_owner_id: u.id)
#             if a_token.present?
#               a_token.destroy
#             end
#           end
#           u.update(is_logged_in: false, token_web: nil)
#         end
#       end
#     end
#     # The authorization server responds with HTTP status code 200 if the
#     # token has been revoked successfully or if the client submitted an invalid token
#     render json: {staus: 'ok'}, status: 200
#   end

#   private

#   def revoke_token(token)
#     token = Doorkeeper::AccessToken.by_token(token) || Doorkeeper::AccessToken.by_refresh_token(token)
#     if token && doorkeeper_token.same_credential?(token)
#       token.revoke
#       true
#     else
#       false
#     end
#   end

#   def strategy
#     @strategy ||= server.token_request params[:grant_type]
#   end

#   def authorize_response
#     @authorize_response ||= strategy.authorize
#   end
# end
