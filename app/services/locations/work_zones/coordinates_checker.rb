module Locations
  module WorkZones
    class CoordinatesChecker < BaseService

      attr_reader :work_zone, :latitude, :longitude

      def call
        polygon.contains? point
      end

      private

      def polygon
        work_zone.create_polygon_geokit
      end

      def point
        Geokit::LatLng.new latitude, longitude
      end

    end
  end
end
