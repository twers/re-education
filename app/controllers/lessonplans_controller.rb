class LessonplansController < ApplicationController

  load_and_authorize_resource

  def index
    @lessonplans = Lessonplan.list_last 4
  end

  def create
    lessonplan = current_user.lessonplans.create(lessonplan_params)
    lessonplan.create_tasks(tasks_params) if lessonplan

    redirect_to lessonplan_path(lessonplan)
  end


  def update
    lessonplan = Lessonplan.find(params[:id])
    lessonplan.update_attributes(lessonplan_params)
    lessonplan.create_tasks(tasks_params)

    redirect_to lessonplan_path(lessonplan)
  end

  def destroy
    lessonplan = Lessonplan.find(params[:id])
    lessonplan.destroy

    redirect_to root_url
  end

  def lessonplan_params
    params[:lessonplan].slice(:title, :content, :short_description, :symbol_img_url, :attachment)
  end

  def tasks_params
    tasks = []
    if params[:tasks].present?
      params[:tasks].each do |task|
        tasks << task.slice(:title, :content)
      end
    end
    tasks
  end

end
