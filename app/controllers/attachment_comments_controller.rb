class AttachmentCommentsController < ApplicationController

  before_filter :load_lessonplan_attachment

  def show
    render :json => @lessonplan_attachment.attachment_comments.to_json
  end

  def create
    comment = @lessonplan_attachment.attachment_comments.build(comment_params)
    comment.publisher = current_user
    if comment.save
      render :json => comment.to_json(:include => :publisher)
    else
      render :json => { status: get_status(comment.errors) }
    end
  end

  private

  def load_lessonplan_attachment
    @lessonplan_attachment = LessonplanAttachment.find(params[:attachment_id])
  end

  def get_status(errors)
    errors.values.flatten.uniq.first
  end

  def comment_params
    params.slice :content
  end
end