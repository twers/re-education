# encoding: utf-8

class SessionsController < ApplicationController
  def new
  end

  def destroy
    self.current_user = nil
    redirect_to :root
  end

  def create
    if publisher = Publisher.authenticate(params[:publisher][:email], params[:publisher][:password])
      self.current_user = publisher
      redirect_to publisher_path(publisher)
    else
      flash.now.alert = '账号或密码错误'
      render :new
    end
  end
end
