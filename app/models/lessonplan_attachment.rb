class LessonplanAttachment < ActiveRecord::Base

  belongs_to :lessonplan
  has_many :comments, :as => :commentable

  mount_uploader :attachment, LessonplanAttachmentsUploader
end
