class Lessonplan < ActiveRecord::Base
	has_many :tasks
	has_many :comments

  mount_uploader :attachment, AttachmentUploader

  def attachment_filename
    read_attribute(:attachment)
  end

end
