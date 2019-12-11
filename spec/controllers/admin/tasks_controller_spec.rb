require 'rails_helper'

RSpec.describe Admin::TasksController, type: :controller do
  context 'Getting statistics' do
    let(:user) { create(:user) }

    let(:task) { create(:task,
      status: :posted,
      owner: user,
      concierge_id: user.id,
      budget: 100.00,
      place: build(:place),
      line_tasks: [
        build(:line_task, budget: 155.00, type_line: 'Change Order', status: 'confirmed')
      ]
    )}
    let(:params) { { status: 'done_confirmed' } }

    it 'change tasks status' do
      user.assign_role(:admin)
      sign_in(user)

      allow(Task::StatusChangeService).to receive(:call) {
        double(:service, result: nil, success?: true, errors: [])
      }
      put :change_status, params: params.merge(id: task.id, task_id: task.id)

      expect(subject).to redirect_to(admin_task_path(task.id))
    end
  end
end
