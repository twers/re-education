class LessonplansController < ApplicationController
	def index
		@lessonplans = Lessonplan.limit(4).order('created_at DESC');
	end

	def new

	end

	def show
		@lessonplan = Lessonplan.find(params[:id])
	end

	def create
		@lessonplan = Lessonplan.new(params[:lessonplan])
		@lessonplan.save
		redirect_to :action => 'show', :id => @lessonplan.id
	end

end
