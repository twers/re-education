module ApplicationHelper

	def current_user
		session[:user]
	end

end
