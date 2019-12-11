class AddFileToMessage < ActiveRecord::Migration[5.0]
  def self.up
    change_table :messages do |t|
      t.attachment :file
    end
  end
end
