module Locationable
  class CheckingWorkZones

    include Interactor

    delegate :latitude, :longitude, :user, to: :context

    def call
      work_zones = Locations::WorkZones::ListByCoordinates.new(latitude: latitude, longitude: longitude).call
      work_zones.each do |work_zone|
        Locations::WorkZones::VisitLogger.new(work_zone: work_zone, user: user).call
      end
    end

  end
end
