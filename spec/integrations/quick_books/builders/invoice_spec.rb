require 'rails_helper'

RSpec.describe QuickBooks::Builders::Invoices do
  let(:invoice_builder) { described_class.new(customers, task) }

  let(:customers) do
    json = File.read('spec/fixtures/quick_books/request_customers_response.json')
    JSON.parse(json).dig('QueryResponse', 'Customer')
  end
  let(:project_task) { create(:project_task, number: 501) }
  let(:task) do
    create(:task, completed_at: Date.parse('2019-09-13'), project_task: project_task,
                  description: 'Kitchen renovation')
  end

  before { allow(task).to receive(:total_sum) { 1000 } }

  describe '#build_body' do
    subject { invoice_builder.build_body }

    let(:expected_result) do
      {
        DocNumber: task.id,
        TxnDate: '2019-09-13',
        DueDate: '2019-10-15',
        Line: [
          {
            DetailType: 'SalesItemLineDetail',
            Amount: 1000.0,
            SalesItemLineDetail:
                  {
                    ItemRef: { name: 'Services', value: '1' },
                    Qty: '1',
                    TaxCodeRef: { value: '2' }
                  },
            Description: 'Kitchen renovation'
          }
        ],
        CustomerRef: { value: '3' },
        BillEmail: { Address: 'page.aleks@gmail.com' },
        BillAddr: { 'Id' => '2', 'Line1' => 'dnipro', 'City' => 'dnipro' }
      }
    end

    it { is_expected.to eq(expected_result) }
  end
end
