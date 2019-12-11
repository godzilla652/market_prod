require 'rails_helper'

RSpec.describe QuickBooks::CallbackProcessor do
  let(:callback_processor) { described_class.new(callback_data) }
  let(:callback_data) do
    {
      'code' => 'AB11567941414VmTnwWcmxU0DdkvzT10qEhiwedhxAUolinO8p',
      'state' => 'nc0zfOsx3kM4AmJZ5BpK',
      'realmId' => '9130346928765026'
    }
  end

  describe '#process' do
    subject(:process) { callback_processor.process }

    let(:auth_client) { instance_double(QuickBooks::AuthClient, request_token: response) }
    let(:response) { OpenStruct.new(body: response_body) }
    let(:response_body) do
      {
        'processor' => 'new_processor',
        'refresh_token' => 'new_refresh_token',
        'expires_in' => 3600
      }
    end

    before do
      allow(QuickBooks::AuthClient).to receive(:new).and_return(auth_client)
    end

    context 'when qb_integration record does not exist' do
      it 'creates new qb_integration record' do
        expect { process }.to change(QuickBooksIntegration, :count).by(1)
      end

      describe 'qb_integration record' do
        let(:qb_integration) { QuickBooksIntegration.last }

        it 'sets correct access_token_expired_at' do
          process
          expect(qb_integration.access_token_expired_at).to be_within(1).of(Time.now + 3600)
        end

        it 'sets correct tokens' do
          process
          expect(qb_integration.tokens).to eq(response_body)
        end
      end
    end

    context 'when qb_integration record exists' do
      let!(:qb_integration) { create(:quick_books_integration) }

      it 'does not create new qb_integration record' do
        expect { process }.not_to change(QuickBooksIntegration, :count)
      end

      it 'updates access_token_expired_at' do
        process
        expect(qb_integration.reload.access_token_expired_at).to be_within(1).of(Time.now + 3600)
      end

      it 'updates tokens' do
        process
        expect(qb_integration.reload.tokens).to eq(response_body)
      end
    end
  end
end
