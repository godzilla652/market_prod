class Permission < ApplicationRecord
  belongs_to :role

  default_scope { order("created_at ASC") }

  def identifier
    [subject_class, action, role_id].join '-'
  end


end
