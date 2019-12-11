class Device < ApplicationRecord
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id", optional: true
  validates :token, uniqueness: true
end
