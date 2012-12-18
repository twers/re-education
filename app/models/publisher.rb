class Publisher < ActiveRecord::Base
	belongs_to :user

	mount_uploader :avatar, AvatarUploader

	def attachment_filename
    read_attribute(:avatar)
  end

  def name
  	return self.alternative_name unless self.alternative_name.empty?
		self.user.nick_name
	end
end
