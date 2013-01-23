class Lessonplan < ActiveRecord::Base
  has_many :tasks, :dependent => :delete_all
  has_many :comments, :dependent => :delete_all
  belongs_to :publisher

  mount_uploader :attachment, AttachmentUploader

  def attachment_filename
    read_attribute(:attachment)
  end

  def Lessonplan.list_last num
    Lessonplan.limit(num).order('created_at DESC')
  end
end