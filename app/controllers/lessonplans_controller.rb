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
		@lessonplan = Lessonplan.create!(params[:lessonplan])

		unless params[:tasks].nil? then
			params[:tasks].each do |task|
			  @lessonplan.tasks.create!(task)
			end
		end	

		redirect_to lessonplan_path(@lessonplan)
	end

	def edit
		@lessonplan = Lessonplan.find(params[:id])
	end

	def update
		@lessonplan = Lessonplan.find(params[:id])
		@lessonplan.update_attributes(params[:lessonplan])

		unless params[:tasks].nil? then
			params[:tasks].each do |task|
				if task[:id].empty? then
					t = Task.create! task
					t.lessonplan = @lessonplan
				else
					t = Task.find task[:id]
					t.update_attributes task
				end
				t.save
			end
		end

		redirect_to lessonplan_path(@lessonplan)
	end

end
