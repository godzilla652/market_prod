module QuickBooks
  class AccessToken
    def access_token
      return qb_integration.access_token if valid_access_token?

      new_access_token
    end

    private

    def valid_access_token?
      qb_integration.access_token_expired_at > Time.now
    end

    def new_access_token
      response_body = request_access_token.body

      update_qb_integration(response_body)

      response_body['access_token']
    end

    def request_access_token
      auth_client.refresh_auth_token(qb_integration.refresh_token)
    end

    def update_qb_integration(response_body)
      expired_at = Time.now + response_body['expires_in']
      qb_integration.update!(tokens: response_body, access_token_expired_at: expired_at)
    end

    def qb_integration
      @qb_integration ||= QuickBooksIntegration.last
    end

    def auth_client
      QuickBooks::AuthClient.new
    end
  end
end
