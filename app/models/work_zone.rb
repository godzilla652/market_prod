class WorkZone < ApplicationRecord
  validates :name, uniqueness: true

  def create_polygon_geokit
    spot1 = spot_one.gsub('(', '').gsub(')', '').split(',')
    spot2 = spot_two.gsub('(', '').gsub(')', '').split(',')
    spot3 = spot_three.gsub('(', '').gsub(')', '').split(',')
    spot4 = spot_four.gsub('(', '').gsub(')', '').split(',')
    Geokit::Polygon.new([
                            Geokit::LatLng.new(spot1[0], spot1[1]),
                            Geokit::LatLng.new(spot2[0], spot2[1]),
                            Geokit::LatLng.new(spot3[0], spot3[1]),
                            Geokit::LatLng.new(spot4[0], spot4[1]),
                        ])
  end

  def center_coordinates
    @center_coordinates ||= WorkZoneCoordinatesObject.new spot_one
  end

  def paths
    @paths ||= [
      WorkZoneCoordinatesObject.new(spot_one),
      WorkZoneCoordinatesObject.new(spot_two),
      WorkZoneCoordinatesObject.new(spot_three),
      WorkZoneCoordinatesObject.new(spot_four)
    ]
  end

end
