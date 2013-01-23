class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      thanks
    else
      flash.now.alert = "Please fill all fields."
      render :new
    end
  end

  def thanks
    render :thanks
  end

end