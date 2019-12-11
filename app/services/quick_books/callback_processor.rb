module QuickBooks
  class CallbackProcessor
    def initialize(callback_data)
      @callback_data = callback_data
    end

    def process
      response = auth_client.request_token(authorization_code)

      update_qb_integration(response.body)
    end

    private

    def authorization_code
      @callback_data['code']
    end

    def update_qb_integration(response_body)
      expired_at = Time.now + response_body['expires_in']
      qb_integration.update!(tokens: response_body, access_token_expired_at: expired_at)
    end

    def auth_client
      QuickBooks::AuthClient.new
    end

    def qb_integration
      QuickBooksIntegration.first_or_initialize
    end
  end
end
