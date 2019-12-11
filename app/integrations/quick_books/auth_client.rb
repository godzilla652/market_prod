module QuickBooks
  class AuthClient
    def build_auth_uri
      scopes = [IntuitOAuth::Scopes::ACCOUNTING]

      oauth_client.code.get_auth_uri(scopes)
    end

    def request_token(authorization_code)
      oauth_client.token.get_bearer_token(authorization_code)
    end

    def refresh_auth_token(refresh_token)
      oauth_client.token.refresh_tokens(refresh_token)
    end

    private

    def oauth_client
      IntuitOAuth::Client.new(client_id, client_secret, redirect_url, environment)
    end

    def redirect_url
      host_uri + redirect_path
    end

    def client_id
      quick_books_settings.client_id
    end

    def client_secret
      quick_books_settings.client_secret
    end

    def redirect_path
      quick_books_settings.redirect_path
    end

    def environment
      quick_books_settings.environment
    end

    def host_uri
      Settings.host_uri
    end

    def quick_books_settings
      Settings.quick_books
    end
  end
end
