class LessonplansController < ApplicationController
	def index
		@lessonplans = Lessonplan.find(:all)
	end

	def new

	end

	def create
		@lessonplan = Lessonplan.new(params[:lessonplan])
		@lessonplan.save
		redirect_to :action => 'index'
	end
end
