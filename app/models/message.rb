class Message < ApplicationRecord
  Paperclip::UriAdapter.register
  Paperclip::DataUriAdapter.register

  belongs_to :author, :class_name => "User", :foreign_key => "author_id", optional: true
  belongs_to :recipient, :class_name => "User", :foreign_key => "recipient_id", optional: true

  belongs_to :task, optional: true
  belongs_to :task_suggestion, optional: true

  has_attached_file :file, :styles => {:medium => "300x300>", :thumb => "200x200>", :big => "1280x1280>"}
  validates_attachment :file, :content_type => {:content_type => ["image/jpeg", "image/gif", "image/png"]},
                       :size => {:in => 0..15.megabytes}

  def file_data=(data_value)
    StringIO.open(Base64.strict_decode64(data_value)) do |data|
      data.class.class_eval { attr_accessor :original_filename, :content_type }
      data.original_filename = "temp#{DateTime.now.to_i}.png"
      data.content_type = "image/png"
      self.file = data
    end
  end

  def author?(user)
    self.author == user
  end
end
