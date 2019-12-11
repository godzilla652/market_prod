require 'rails_helper'

RSpec.describe Pdf::InvoiceOrderBuilder do

  let(:task) { create(:task, budget: 100.00, place: build(:place), line_tasks: [
    build(:line_task, budget: 155.00, type_line: 'Change Order')
  ]) }

  context 'Generate PDF' do
    it 'Correct Invoice Order' do
      line_task = task.line_tasks.first
      Pdf::InvoiceOrderBuilder.new(task).build!
      expect(public_file_exist?(line_task.invoice_pdf_path)).to be_truthy
    end
  end
end
