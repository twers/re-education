class LessonplansController < ApplicationController
  load_and_authorize_resource

  def index
    @lessonplans = Lessonplan.list_last 4
  end

  def new

  end

  def show
    @lessonplan = Lessonplan.find(params[:id])
  end

  def create
    lessonplan = current_user.lessonplans.create params[:lessonplan]
    lessonplan.create_tasks params[:tasks]  if lessonplan

    redirect_to lessonplan_path(lessonplan)
  end

  def edit
    @lessonplan = Lessonplan.find(params[:id])
  end

  def update
    @lessonplan = Lessonplan.find(params[:id])
    @lessonplan.update_attributes(params[:lessonplan])

    @lessonplan.tasks.delete_all

    unless params[:tasks].nil? then
      params[:tasks].each do |task|
        t = Task.create! task
        t.lessonplan = @lessonplan
        t.save
      end
    end

    redirect_to lessonplan_path(@lessonplan)
  end

  def destroy
    lessonplan = Lessonplan.find(params[:id])
    lessonplan.destroy

    redirect_to root_url
  end

end
