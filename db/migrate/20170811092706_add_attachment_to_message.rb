class AddAttachmentToMessage < ActiveRecord::Migration[5.0]
  def change
    remove_attachment :messages, :file
    add_attachment :messages, :photo
    add_attachment :messages, :audio
  end
end
