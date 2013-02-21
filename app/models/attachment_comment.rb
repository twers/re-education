class AttachmentComment < ActiveRecord::Base
  belongs_to :lessonplan_attachment
  belongs_to :publisher

  validates_associated :lessonplan_attachment
  validates_presence_of :content, :message => 'empty'
  validates_uniqueness_of :content, :scope => :publisher_id, :message => 'duplicate'
end
