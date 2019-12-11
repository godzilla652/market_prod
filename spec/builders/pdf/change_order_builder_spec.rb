require 'rails_helper'

RSpec.describe Pdf::ChangeOrderBuilder do

  let(:task) { create(:task, place: build(:place), line_tasks: [
    build(:line_task, budget: 155.00, type_line: 'Change Order')
  ]) }

  context 'Generate PDF' do
    it 'Correct Change Order' do
      line_task = task.line_tasks.first
      Pdf::ChangeOrderBuilder.new(task).build!(line_task)
      expect(public_file_exist?(line_task.invoice_pdf_path)).to be_truthy
    end
  end
end
