module ApplicationHelper

	def current_user
		session[:user]
	end
	
	def online
		current_user.present?
	end
end
