module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :current_user

    def connect
      # logger.add_tags 'ActionCable=============>>>>>>'
      self.current_user = find_verified_user
    end

    protected

    def find_verified_user
      unless request.headers['Authorization'].nil?
        User.find(
            Oauth::AccessToken.by_token(
                request.headers['Authorization'].remove('bearer').strip
            ).resource_owner_id
        )
      end
    end
  end
end
