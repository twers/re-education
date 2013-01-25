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
  belongs_to :publisher

  mount_uploader :attachment, AttachmentUploader

  def attachment_filename
    read_attribute(:attachment)
  end

  def Lessonplan.list_last num
    Lessonplan.limit(num).order('created_at DESC')
  end
end
