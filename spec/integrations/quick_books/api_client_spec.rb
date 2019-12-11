require 'rails_helper'

RSpec.describe QuickBooks::ApiClient do
  let(:api_client) { described_class.new(auth_token) }
  let(:auth_token) { 'auth_token' }
  let(:base_url) { 'https://quickbooks.api.intuit.com/v3/company/9130346928765026/' }
  let(:headers) do
    {
      accept: 'application/json',
      authorization: 'Bearer auth_token',
      "content-type": 'application/json'
    }
  end

  describe '#customers' do
    subject(:request_customers) { api_client.customers }

    let(:customers_response) { File.read('spec/fixtures/quick_books/request_customers_response.json') }
    let(:response) { OpenStruct.new(body: customers_response) }

    before { allow(RestClient).to receive(:get) { response } }

    it 'returns parsed response' do
      expect(request_customers).to eq(JSON.parse(customers_response))
    end

    it 'do request to correct url' do
      request_customers
      url = "#{base_url}query?query=select%20*%20from%20Customer&minorversion=40"
      expect(RestClient).to have_received(:get).with(url, headers)
    end
  end

  describe '#create_invoice' do
    subject(:create_invoice) { api_client.create_invoice(body) }

    let(:body) { { request_body: 'invoice data' } }
    let(:invoice_response) { File.read('spec/fixtures/quick_books/create_invoice_response.json') }
    let(:response) { OpenStruct.new(body: invoice_response) }

    before { allow(RestClient).to receive(:post) { response } }

    it 'returns parsed response' do
      expect(create_invoice).to eq(JSON.parse(invoice_response))
    end

    it 'do request to correct url' do
      create_invoice
      url = "#{base_url}invoice?&minorversion=40"
      expect(RestClient).to have_received(:post).with(url, body.to_json, headers)
    end
  end
end
