class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(params[:feedback])
    if @feedback.save
      NotificationsMailer.new_feedback(@feedback).deliver
    else
      flash.now[:alert] = 'Please fill all fields.'
      render :new
    end
  end

end
