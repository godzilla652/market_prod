class CreateQuickBooksIntegration < ActiveRecord::Migration[5.2]
  def change
    create_table :quick_books_integrations do |t|
      t.string :refresh_token
      t.timestamps
    end
  end
end
