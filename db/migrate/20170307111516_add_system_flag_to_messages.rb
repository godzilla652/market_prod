class AddSystemFlagToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :system, :boolean, :default => false
  end
end
