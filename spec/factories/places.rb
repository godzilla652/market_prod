FactoryBot.define do
  factory :place do
    address { FFaker::Address.street_address }
  end
end
