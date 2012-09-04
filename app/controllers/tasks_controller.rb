class TasksController < ApplicationController

	before_filter :load_lessonplan

	def load_lessonplan
		lessonplan_id = params[:lessonplan_id]
		@lessonplan = Lessonplan.find(lessonplan_id) unless lessonplan_id.blank? 
	end

	def index
		render :json => @lessonplan.tasks unless @lessonplan.nil?
	end

	def create
		unless @lessonplan.nil? then
			task = Task.new params[:task]
			task.lessonplan = @lessonplan
			task.save

			render :json => task
		end
	end

end
