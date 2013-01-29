class CommentsController < ApplicationController

  before_filter :load_lessonplan

  def load_lessonplan
    lessonplan_id = params[:lessonplan_id]
    @lessonplan = Lessonplan.find(lessonplan_id) unless lessonplan_id.blank?
  end

  def index
    comments = @lessonplan.comments unless @lessonplan.nil?
    render :json => comments.to_json(:include => :publisher)
  end

  def create
    unless @lessonplan.nil? then
      p "*" * 10
      p session[:user_id]

      if is_empty?(params[:comment])
        p "same comment"
        render :json => "{\"status\": \"empty\"}"
        return
      end
      comment = Comment.new params[:comment]
      if Comment.exists? :content => comment.content, :user_id => session[:user_id]
        p "same comment"
        render :json => "{\"status\": \"duplicate\"}"
      else
        comment.lessonplan = @lessonplan
        comment.publisher = current_user
        comment.save

        render :json => comment.to_json(:include => :publisher)
      end
    end
  end

  def destroy
    ret = true;
    begin
      Comment.delete(params[:id])
    rescue
      ret = false
    end

    render :json => { :ret => ret }
  end

  private

  def is_empty?(comment)
    comment.nil? || params[:comment].size == 0
  end
end
