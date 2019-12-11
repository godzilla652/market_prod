class ChangeQuickBooksIntegration < ActiveRecord::Migration[5.2]
  def change
    remove_column(:quick_books_integrations, :refresh_token, :string)
    add_column(:quick_books_integrations, :tokens, :jsonb, default: {})
    add_column(:quick_books_integrations, :access_token_expired_at, :datetime)
  end
end
