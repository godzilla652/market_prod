module Locationable
  class StoreCurrentLocation

    include Interactor::Organizer

    organize Locationable::UpdateUserCoordinates,
             Locationable::CheckingWorkZones

  end
end
