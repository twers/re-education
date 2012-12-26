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
			comment = Comment.new params[:comment]
			comment.lessonplan = @lessonplan
			comment.publisher = current_user
			comment.save

			render :json => comment.to_json(:include => :publisher)
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

end
