class AddAttachmentPhotoToTasks < ActiveRecord::Migration[5.2]
  def self.up
    change_table :tasks do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :tasks, :photo
  end
end
