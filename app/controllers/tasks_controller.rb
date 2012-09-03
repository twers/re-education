class TasksController < ApplicationController

	def index
		lessonplan_id = params[:lessonplan_id]
	end

	def create
		lessonplan_id = params[:lessonplan_id]
		lessonplan = Lessonplan.find(lessonplan_id) unless lessonplan_id.blank?
		unless lessonplan.nil? then
			task = Task.new params[:task]
			task.lessonplan = lessonplan
			task.save

			render :json => task
		end
	end

end
