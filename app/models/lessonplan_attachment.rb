class LessonplanAttachment < ActiveRecord::Base

  belongs_to :lessonplan

  mount_uploader :attachment, AttachmentUploader
end
