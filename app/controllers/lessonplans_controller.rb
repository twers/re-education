class LessonplansController < ApplicationController
	def index
		
	end

	def new
		@lessonplan = Lessonplan.new
	end

	def create
		@lessonplan = Lessonplan.new(params[:lessonplan])
		@lessonplan.save
		render :json => Lessonplan.find(:all)
	end
end
