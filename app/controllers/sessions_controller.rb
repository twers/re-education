class SessionsController < ApplicationController
  def new
  end

  def destroy
    self.current_user = nil
    redirect_to :root
  end

  def create
    if simple_captcha_valid?
      if publisher = Publisher.authenticate(params[:publisher][:email], params[:publisher][:password])
        self.current_user = publisher
        redirect_to publisher_path(publisher)
      else
        redirect_to login_path
      end
    else
      render :new
    end
  end
end
