class Publisher < ActiveRecord::Base
	has_many :lessonplans

	mount_uploader :avatar, AvatarUploader

	def attachment_filename
    read_attribute(:avatar)
  end

  def name
  	return self.alternative_name unless self.alternative_name.empty?
	end
end
