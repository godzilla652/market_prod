class TaskSuggestion < ApplicationRecord
  validates :user_id, uniqueness: {scope: :task_id, message: 'Bit to this task already exist'}

  after_save :set_suggestion_for_messages

  belongs_to :task, optional: true
  belongs_to :user, optional: true

  #validates_presence_of :price, :proposed_text

  has_many :messages, :class_name => "Message", :foreign_key => "suggestion_id", dependent: :destroy

  after_create :increment_suggestions_counter
  after_destroy :decrement_suggestions_counter


  def assigned?
    self.task.suggestion_id == self.id
  end

  def increment_suggestions_counter
    self.task.increment!(:suggestions_counter, 1)
    unless task.tender?
      task.update(suggestion_id: id) if task.suggestion_id.nil?
    end
  end

  def decrement_suggestions_counter
    self.task.increment!(:suggestions_counter, -1)
  end

  def message_exists?
    Message.where(task_id: self.task_id, author_id: self.user_id).exists?
  end

  def set_suggestion_for_messages
    if message_exists?
      Message.where(task_id: self.task_id, author_id: self.user_id)
          .or(Message.where(task_id: self.task_id, recipient_id: self.user_id)).each do |message|
        message.update_attribute(:suggestion_id, self.id)
      end
    end
  end
end
