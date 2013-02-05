class LessonplanAttachmentsController < ApplicationController

  before_filter :load_lessonplan

  def load_lessonplan
    lessonplan_id = params[:lessonplan_id]
    @lessonplan = Lessonplan.find(lessonplan_id) unless lessonplan_id.blank?
  end

  def index
    render :json => @lessonplan.lessonplan_attachments.order('created_at DESC') if request.accept.include? "application/json"
  end

  def create
  	attachment = LessonplanAttachment.new params[:lessonplan_attachment]
  	attachment.lessonplan = @lessonplan
    attachment.name = params[:name]
  	attachment.save

  	redirect_to lessonplan_attachments_path(@lessonplan)
  end

end
