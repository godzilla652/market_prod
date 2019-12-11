class ChangeAttachmentToMessage < ActiveRecord::Migration[5.0]
  def change
    remove_attachment :messages, :photo
    remove_attachment :messages, :audio
    add_attachment :messages, :file
  end
end
