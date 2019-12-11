class Dialog < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :task_suggestion, optional: true
end
