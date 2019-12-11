module Contractable
  class UpdateUser

    include Interactor::Organizer

    organize Contractable::UpdateContract

  end
end
