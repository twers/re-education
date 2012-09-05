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

		unless params[:tasks].nil? then
			tasks = params[:tasks]
			tasks.each do |c|
				t = Task.new c
				t.lessonplan = @lessonplan
				t.save
			end
		end	

		redirect_to :action => 'show', :id => @lessonplan.id
	end

end
