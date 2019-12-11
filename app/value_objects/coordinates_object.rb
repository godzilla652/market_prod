class CoordinatesObject

  attr_reader :latitude, :longitude

  def initialize(latitude:, longitude:)
    @latitude  = latitude.to_f
    @longitude = longitude.to_f
  end

  alias_attribute :lat, :latitude
  alias_attribute :lng, :longitude

end
