class UsersPendingsTask < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :task, optional: true

  after_destroy :decrement_positions

  def increment_positions
    pending_tasks = UsersPendingsTask.where(user_id: self.user_id) # AND position > #{self.position}")
    pending_tasks.each do |pending_task|
      pending_task.position += 1
      pending_task.save
    end
  end

  def decrement_positions
    pending_tasks = UsersPendingsTask.where("user_id = #{self.user_id} AND position > #{self.position}")
    pending_tasks.each do |pending_task|
      pending_task.position -= 1
      pending_task.save
    end
  end
end