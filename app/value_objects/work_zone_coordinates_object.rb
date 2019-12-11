class WorkZoneCoordinatesObject

  attr_accessor :params

  def initialize(params)
    @params = params

  end

  def coordinates
    params.gsub(/\(|\)/, '').split ','
  end

  def latitude
    coordinates[0].to_f
  end

  def longitude
    coordinates[1].to_f
  end

  alias_method :lat, :latitude
  alias_method :lng, :longitude

end
