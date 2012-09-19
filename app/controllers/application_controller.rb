class ApplicationController < ActionController::Base
  # protect_from_forgery

	def current_user
		session[:user]
	end

	def logout
		session[:user] = nil
		render :json => { :result => true }
	end

end
