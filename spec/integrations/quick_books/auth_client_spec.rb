require 'rails_helper'

RSpec.describe QuickBooks::AuthClient do
  let(:auth_client) { described_class.new }

  describe '#build_auth_uri', :vcr do
    subject(:build_auth_uri) { auth_client.build_auth_uri }

    it 'returns auth_uri' do
      expect(build_auth_uri).to include('https://appcenter.intuit.com/connect/oauth2?client_id')
    end
  end
end
