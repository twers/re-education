class ApplicationController < ActionController::Base
  # protect_from_forgery

	rescue_from ActionController::RoutingError,       :with => :render_404
	rescue_from ActionController::UnknownController,  :with => :render_404
	rescue_from ActionController::UnknownAction,      :with => :render_404
	rescue_from ActiveRecord::RecordNotFound, :with => :render_404
	
	rescue_from CanCan::AccessDenied do |exception|
	  flash[:error] = "Access denied."
	  redirect_to root_url
	end

	def render_404
	  redirect_to '/404.html'
	end  

	def current_user
		User.find session[:user_id] unless session[:user_id].nil?
	end

	def logout
		session[:user_id] = nil
		render :json => { :result => true }
	end
	
end
