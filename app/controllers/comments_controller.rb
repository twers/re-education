class CommentsController < ApplicationController

	before_filter :load_lessonplan

	def load_lessonplan
		lessonplan_id = params[:lessonplan_id]
		@lessonplan = Lessonplan.find(lessonplan_id) unless lessonplan_id.blank? 
	end

	def index
		render :json => @lessonplan.comments unless @lessonplan.nil?
	end

	def create
		unless @lessonplan.nil? then
			comment = Comment.new params[:comment]
			comment.lessonplan = @lessonplan
			comment.user = current_user
			comment.save

			render :json => comment
		end
	end

end
