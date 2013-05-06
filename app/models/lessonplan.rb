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
  has_many :comments, :as => :commentable, :dependent => :delete_all
  has_many :lessonplan_attachments, :dependent => :delete_all

  belongs_to :publisher

  mount_uploader :attachment, AttachmentUploader

  def images
    attachments(%w[jpg jpeg gif png bmp])
  end

  def scratches
    attachments(%w[sb])
  end

  def symbol_image
    return self.symbol_img_url if self.symbol_img_url.present?
    self.attachment.thumb.url
  end

  def attachments(extensions)
    ret = []
    self.lessonplan_attachments.order('created_at DESC').each do |attachment|
      ret.push attachment if attachment.name && extensions.include?(attachment.name.split('.').last.downcase)
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

  def self.ordered_lessonplans
    title_filters = ReEducation::Application.config.lessonplan_title_filters.reverse
    ordered_lessonplans = Lessonplan.all.reverse

    title_filters.each do |title|
      lessonplan = ordered_lessonplans.select{ |l| l.title == title }.first
      ordered_lessonplans.prepend(ordered_lessonplans.delete(lessonplan)) unless lessonplan.nil?
    end
    ordered_lessonplans
  end

end
