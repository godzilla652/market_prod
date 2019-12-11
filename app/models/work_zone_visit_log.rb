class WorkZoneVisitLog < ApplicationRecord

  belongs_to :user
  belongs_to :work_zone

  def spended_seconds
    time_to - time_from
  end

end
