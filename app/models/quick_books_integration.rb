class QuickBooksIntegration < ApplicationRecord
  def access_token
    tokens.dig('access_token')
  end

  def refresh_token
    tokens.dig('refresh_token')
  end
end
