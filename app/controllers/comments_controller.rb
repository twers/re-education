class CommentsController < ApplicationController
  
  # There is no authentication and permission check, But I won`t fix this in refactoring.
  # TODO 
  # Fix the bug 

  before_filter :fetch_parent

  def show
    render :json => @commentable.comments.to_json
  end

  def index
    @comments = @commentable.comments
    respond_to do |format|
      format.html { render layout: nil }
      format.json { render :json => @comments.to_json(:include => :publisher) }
    end
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.publisher = current_user
    respond_to do |format|
      if @comment.save
        format.html { render :show, :layout => nil }
        format.json { render :json => @comment.to_json(:include => :publisher) }
      else
        format.html { render :text => nil }
        format.json { render :json => { status: get_status(@comment.errors) } }
      end
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render :json => { :ret => comment.destroyed? }
  end

  private

  def get_commentable_klass_and_id
    params[:lessonplan_attachment_id] = params[:attachment_id]
    [:lessonplan_attachment_id, :lessonplan_id].each do |sym|
      return sym.to_s.gsub(/_id$/, '').classify.constantize, params[sym] if params[sym].present?
    end
  end

  def fetch_parent
    klass, commentable_id = get_commentable_klass_and_id
    render :json => { status: 'resource could not be found' } unless @commentable = klass.find_by_id(commentable_id)
  end

  def get_status(errors)
    errors.values.flatten.uniq.first
  end

  def comment_params
    params[:comment].slice(:content)
  end

end
