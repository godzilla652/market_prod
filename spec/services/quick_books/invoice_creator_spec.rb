require 'rails_helper'

RSpec.describe QuickBooks::InvoiceCreator do
  let(:invoice_creator) { described_class.new(task) }

  describe '#create', :vcr do
    subject(:create_invoice) { invoice_creator.create }
    let(:project_task) { create(:project_task, number: 170_719) }

    let(:task) do
      create(:task, completed_at: Date.parse('2019-09-13'), project_task: project_task,
                    description: 'Kitchen renovation')
    end

    before do
      create(:quick_books_integration, access_token_expired_at: Time.now,
                                       tokens:
                                           { 'refresh_token' => 'AB11576770249CLsdxXhiS1Kv7gVpzBm0I63CdhJSoiDvYUPDV',
                                             'access_token' => 'access_token' })
    end

    it 'returns invoice response' do
      expect(create_invoice).to include('Invoice' => instance_of(Hash))
    end
  end
end
