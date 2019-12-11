module GeoData
  class AddressDetector < BaseService

    attr_reader :latitude, :longitude

    def call
      address
    end

    private

    def geocoder_results
      Geocoder.search [latitude, longitude]
    end

    def possible_address
      geocoder_results&.first
    end

    def address
      possible_address&.formatted_address
    end

  end
end
