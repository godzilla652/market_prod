class FeedNotification < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id', optional: true
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', optional: true
end
