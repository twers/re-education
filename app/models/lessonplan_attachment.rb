class LessonplanAttachment < ActiveRecord::Base

  belongs_to :lessonplan
  has_many :attachment_comments

  mount_uploader :attachment, LessonplanAttachmentsUploader
end
