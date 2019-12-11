require 'rails_helper'

RSpec.describe Task::StatusChangeService do

  context 'Change task status' do
    let(:concierge) { create(:user) }
    let(:owner) { create(:user) }

    let(:task) { create(:task,
      status: :posted,
      owner: owner,
      concierge_id: concierge.id,
      budget: 100.00,
      place: build(:place),
      line_tasks: [
        build(:line_task, budget: 155.00, type_line: 'Change Order', status: 'confirmed')
      ]
    )}

    before(:each) do
      allow(Pdf::ChangeOrderBuilder).to receive_message_chain('new.build!') { true }
      allow(Pdf::BackChargeBuilder).to receive_message_chain('new.build!') { true }
      allow(Pdf::InvoiceOrderBuilder).to receive_message_chain('new.build!') { true }
    end

    it "Change status 'post' => 'done_confirmed'" do
      status_service = Task::StatusChangeService.call(owner,
                                                      task_id: task.id,
                                                      status: 'done_confirmed')
      expect(status_service.success).to be_truthy

      expect(task.reload.done_confirmed?).to be_truthy
    end

    it "Change status 'done' => 'done_confirmed'" do
      status_service = Task::StatusChangeService.call(owner,
                                                      task_id: task.id,
                                                      status: 'done')
      expect(status_service.success).to be_truthy

      expect(task.reload.done?).to be_truthy
    end

    it 'Process incorrect status' do
      status_service = Task::StatusChangeService.call(owner,
                                                      task_id: task.id,
                                                      status: 'incorrect')
      expect(status_service.success).to be_falsey
      expect(status_service.errors).to include(/wrong task status/)
    end
  end
end
