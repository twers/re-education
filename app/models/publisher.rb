class Publisher < ActiveRecord::Base
	belongs_to :user

	mount_uploader :avatar, AvatarUploader

	def attachment_filename
    read_attribute(:avatar)
  end
end
