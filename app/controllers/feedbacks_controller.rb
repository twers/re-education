class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      NotificationsMailer.new_feedback(@feedback).deliver
    else
      flash.now[:alert] = 'Please fill all fields.'
      render :new
    end
  end

  private

  def feedback_params
    params[:feedback].slice(:email, :body)
  end

end
