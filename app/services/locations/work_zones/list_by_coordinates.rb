module Locations
  module WorkZones
    class ListByCoordinates < BaseService

      attr_reader :latitude, :longitude

      def call
        work_zones.select {|work_zone| in_work_zone? work_zone }
      end

      private

      def work_zones
        WorkZone.all
      end

      def in_work_zone?(work_zone)
        Locations::WorkZones::CoordinatesChecker.new(work_zone: work_zone, latitude: latitude, longitude: longitude).call
      end

    end
  end
end
