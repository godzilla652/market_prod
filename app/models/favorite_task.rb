class FavoriteTask < ApplicationRecord
  validates :user_id, uniqueness: {scope: :task_id, message: 'This task has already been added to favorites'}
  belongs_to :user, optional: true
  belongs_to :task, optional: true
end
