module ApplicationHelper

	def current_user
		session[:user]
	end
	
	def online
		current_user.present?
	end

	def feature_on?
		true
	end
end
