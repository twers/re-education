class LessonplanAttachmentsController < ApplicationController

  before_filter :load_lessonplan

  def load_lessonplan
    lessonplan_id = params[:lessonplan_id]
    @lessonplan = Lessonplan.find(lessonplan_id) unless lessonplan_id.blank?
  end

  def index
    if request.headers['X-Requested-With'] == "XMLHttpRequest"
      file_type = params[:file_type]
      file_type = :images.to_s if file_type.nil?

      if file_type == :images.to_s
        sources = @lessonplan.images
      elsif file_type == :scratches.to_s
        sources = @lessonplan.scratches
      end
      render :json => sources || []
    end
  end

  def create
  	attachment = LessonplanAttachment.new params[:lessonplan_attachment]
  	attachment.lessonplan = @lessonplan
    attachment.name = params[:name]
  	attachment.save

  	redirect_to lessonplan_attachments_path(@lessonplan)
  end

  def destroy
    success = true;
    begin
      LessonplanAttachment.delete(params[:id])
    rescue
      success = false
    end

    render :json => { :success => success }
  end

end
