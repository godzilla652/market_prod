module Contractable
  class CreateUser

    include Interactor::Organizer

    organize Contractable::CreateContract,
             Contractable::ApproveContract,
             Contractable::DeclineSubContract

  end
end
