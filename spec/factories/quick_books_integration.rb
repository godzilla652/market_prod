FactoryBot.define do
  factory :quick_books_integration do
    tokens do
      {
        'expires_in' => 3600,
        'token_type' => 'bearer',
        'access_token' => 'valid_access_token',
        'refresh_token' => 'valid_refresh_token',
        'x_refresh_token_expires_in' => 8_726_019
      }
    end
    access_token_expired_at { Time.now + 3600 }
  end
end
