class Complaint < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id", optional: true
  belongs_to :user, optional: true
  belongs_to :task, optional: true

  def invalid_recipiend?(careent_user)
    careent_user.id == self.user_id
  end
end
