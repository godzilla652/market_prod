module QuickBooks
  class InvoiceCreator
    def initialize(task)
      @task = task
    end

    def create
      customers = request_customers
      request_body = build_request_body(customers)

      create_invoice(request_body)
    end

    private

    def request_customers
      response = QuickBooks::ApiClient.new(access_token).customers
      response.dig('QueryResponse', 'Customer')
    end

    def build_request_body(customers)
      QuickBooks::Builders::Invoices.new(customers, @task).build_body
    end

    def create_invoice(request_body)
      QuickBooks::ApiClient.new(access_token).create_invoice(request_body)
    end

    def access_token
      @access_token ||= QuickBooks::AccessToken.new.access_token
    end
  end
end
