class CommentsController < ApplicationController
  
  # There is no authentication and permission check, But I won`t fix this in refactoring.
  # TODO 
  # Fix the bug 

  before_filter :load_lessonplan

  def index
    comments = @lessonplan.comments
    render :json => comments.to_json(:include => :publisher)
  end

  def create
    comment = @lessonplan.comments.build(comment_params)
    comment.publisher = current_user
    if comment.save
      render :json => comment.to_json(:include => :publisher)
    else
      render :json => { status: get_status(comment.errors) }
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render :json => { :ret => comment.destroyed? }
  end

  private

  def load_lessonplan
    render :json => { status: 'publisher is nil' } unless @lessonplan = Lessonplan.find_by_id(params[:lessonplan_id])    
  end

  def get_status(errors)
    errors.values.flatten.uniq.first
  end

  def comment_params
    params[:comment].slice(:content)
  end

end
