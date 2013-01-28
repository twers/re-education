require 'digest/md5'

class PublishersController < ApplicationController

  before_filter :find_publisher, :only => [:show, :update]

  load_and_authorize_resource

  def find_publisher
    @publisher = Publisher.find(params[:id])
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new params[:publisher]

    # trigger validation
    @publisher.valid?

    unless simple_captcha_valid? then
      p '*' * 10
      @publisher.errors.add :validation_code, "验证码有误"
    end

    if !(params[:password_copy].eql? @publisher.password) then
      @publisher.errors.add :password, "两次密码输入不一致"
    end

    if @publisher.errors.empty? then

      @publisher.password = Digest::MD5.hexdigest @publisher.password
      @publisher.save!

      session[:user_id] = @publisher.id
      redirect_to publisher_path(@publisher)
    else
      p '*' * 10
      p @publisher.errors
      render "new", :layout => true
    end
  end

  def edit
  end

  def show
    @publisher = Publisher.find(params[:id])
  end

  def update
    @publisher.alternative_name = params[:publisher][:alternative_name]

    if @publisher.valid? and @publisher.update_attributes(params[:publisher]) then
      redirect_to publisher_path(@publisher)
    else
      render "edit", :layout => true
    end
  end
end
