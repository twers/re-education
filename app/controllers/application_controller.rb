class ApplicationController < ActionController::Base
  include SimpleCaptcha::ControllerHelpers

  protect_from_forgery

  rescue_from ActionController::RoutingError,       :with => :render_404
  rescue_from ActionController::UnknownController,  :with => :render_404
  rescue_from AbstractController::ActionNotFound,      :with => :render_404
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to '/login'
  end

  def render_404
    redirect_to '/404.html'
  end

  helper_method :current_user

  def current_user
    Publisher.find session[:user_id] unless session[:user_id].nil?
  end

  def current_user=(publisher)
    session[:user_id] = publisher.try(:id)
  end
end
