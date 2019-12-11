require 'rails_helper'

RSpec.describe QuickBooks::AccessToken do
  let(:access_token) { described_class.new }

  describe '#access_token' do
    subject(:get_access_token) { access_token.access_token }

    let!(:qb_integration) { create(:quick_books_integration, access_token_expired_at: expired_at) }

    context 'when access token is still valid' do
      let(:expired_at) { Time.now + 600 }

      it 'returns access token from qb_integration' do
        expect(get_access_token).to eq(qb_integration.access_token)
      end
    end

    context 'when access token is invalid' do
      let(:expired_at) { Time.now - 600 }
      let(:auth_client) { instance_double(QuickBooks::AuthClient, refresh_auth_token: response) }
      let(:response) { OpenStruct.new(body: response_body) }
      let(:response_body) do
        {
          'access_token' => 'new_access_token',
          'refresh_token' => 'new_refresh_token',
          'expires_in' => 3600
        }
      end

      before do
        allow(QuickBooks::AuthClient).to receive(:new).and_return(auth_client)
      end

      it 'requests new access token' do
        get_access_token
        expect(auth_client).to have_received(:refresh_auth_token).with(qb_integration.refresh_token)
      end

      it 'updates qb_integration access_token_expired_at' do
        get_access_token
        expect(qb_integration.reload.access_token_expired_at).to be_within(1).of(Time.now + 3600)
      end

      it 'updates qb_integration tokens' do
        get_access_token
        expect(qb_integration.reload.tokens).to eq(response_body)
      end
    end
  end
end
