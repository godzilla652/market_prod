class ProjectTask < ApplicationRecord
  has_many :tasks, dependent: :destroy

  def to_s
    name
  end
end
