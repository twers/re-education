class Lessonplan < ActiveRecord::Base
	has_many :tasks
  mount_uploader :attachment, AttachmentUploader 

  def attachment_filename
    read_attribute(:attachment)
  end
end
