require 'rails_helper'

RSpec.describe QuickBooksIntegration, type: :model do
  let(:qb_integration) { create(:quick_books_integration, tokens: tokens) }

  let(:tokens) do
    {
      'access_token' => '316pzugmJF26ii751VBiPiEDGKfr8D8Dt',
      'refresh_token' => 'AB11576664463HaSfi1i1KYsn2b6pjWB1Govimgj673UocnOgf'
    }
  end

  describe '#access_token' do
    subject { qb_integration.access_token }

    it { is_expected.to eq('316pzugmJF26ii751VBiPiEDGKfr8D8Dt') }
  end

  describe '#refresh_token' do
    subject { qb_integration.refresh_token }

    it { is_expected.to eq('AB11576664463HaSfi1i1KYsn2b6pjWB1Govimgj673UocnOgf') }
  end
end
