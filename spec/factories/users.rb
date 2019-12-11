FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { SecureRandom.urlsafe_base64(10) }
  end
end
