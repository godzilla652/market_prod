class TaskPayment < ApplicationRecord
  belongs_to :task, optional: true
  belongs_to :user, optional: true
end
