class Rating < ApplicationRecord

  validates :task_id, uniqueness: {scope: [:concierge_id, :hire], message: 'The rating for this task is already given'}
  before_save :positive
  after_save :positive

  def positive
    if self.points >= 3
      self.positive = true
    else
      self.negative = true
    end
  end

  def stated?
    if self.concierge?
      Rating.where(task_id: self.task_id, concierge_id: self.concierge_id, hire_id: self.hire_id, hire: true).exists?
    else
      Rating.where(task_id: self.task_id, concierge_id: self.concierge_id, hire_id: self.hire_id, concierge: true).exists?
    end
  end
end
