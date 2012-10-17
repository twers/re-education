class Lessonplan < ActiveRecord::Base
	has_many :tasks
	has_many :comments
	belongs_to :user

  mount_uploader :attachment, AttachmentUploader

  def attachment_filename
    read_attribute(:attachment)
  end
end
