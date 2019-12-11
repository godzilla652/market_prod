module QuickBooks
  class ApiClient
    def initialize(auth_token)
      @auth_token = auth_token
    end

    def customers
      query_url = 'query?query=select * from Customer'
      request_url = build_request_url(query_url)
      response = RestClient.get(request_url, headers)
      JSON.parse(response.body)
    end

    def create_invoice(body)
      create_url = 'invoice?'
      request_url = build_request_url(create_url)
      response = RestClient.post(request_url, body.to_json, headers)
      JSON.parse(response.body)
    end

    private

    def build_request_url(request_path)
      URI.encode("#{api_url}/#{company_id}/#{request_path}&minorversion=40")
    end

    def company_id
      Settings.quick_books.company_id
    end

    def api_url
      Settings.quick_books.api_url
    end

    def headers
      {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization': "Bearer #{@auth_token}"
      }
    end
  end
end
