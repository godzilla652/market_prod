class Invoice < ApplicationRecord

  include AASM

  has_paper_trail ignore: %i[created_at updated_at]

  belongs_to :payable, polymorphic: true

  aasm whiny_transitions: false, column: :state do
    state :not_paid, initial: true
    state :paid

    event :pay do
      transitions from: :not_paid, to: :paid
    end

    event :unpay do
      transitions from: :paid, to: :not_paid
    end
  end

end
