module Locationable
  class UpdateUserCoordinates

    include Interactor

    delegate :latitude, :longitude, :user, to: :context

    def call
      address = GeoData::AddressDetector.new(latitude: latitude, longitude: longitude).call

      user.update coordinates: { latitude: latitude, longitude: longitude },
                  coordinates_updated_at: Time.now,
                  last_address: address
    end

  end
end
