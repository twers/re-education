# == Schema Information
#
# Table name: lessonplans
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  content           :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  short_description :string(255)
#  symbol_img_url    :string(255)
#  attachment        :string(255)
#  user_id           :integer
#  publisher_id      :integer
#

class Lessonplan < ActiveRecord::Base
  has_many :tasks, :dependent => :delete_all
  has_many :comments, :dependent => :delete_all
  has_many :lessonplan_attachments, :dependent => :delete_all

  belongs_to :publisher

  mount_uploader :attachment, AttachmentUploader

  def images
    attachments(%w[jpg jpeg gif png bmp])
  end

  def scratches
    attachments(%w[sb])
  end

  def attachments(extensions)
    ret = []
    p self.lessonplan_attachments
    self.lessonplan_attachments.order('created_at DESC').each do |attachment|
      ret.push attachment if extensions.include? attachment.name.split('.').last.downcase
    end
    ret
  end

  def has_image_attachments?
    images.length > 0
  end

  def has_sctrach_attachments?
    scratches.length > 0
  end

  def attachment_filename
    read_attribute(:attachment)
  end

  def self.list_last num
    self.limit(num).order('created_at DESC')
  end

  def create_tasks(tasks)
    self.tasks.destroy_all
    tasks.each { |task| self.tasks.create! task } if tasks.present?
  end

end
