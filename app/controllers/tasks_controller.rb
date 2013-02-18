class TasksController < ApplicationController

  before_filter :load_lessonplan

  def index
    render :json => @lessonplan.tasks unless @lessonplan.nil?
  end

  def create
    # If the title and content both are empty, it still could be saved!!
    # Is that right?
      task = @lessonplan.tasks.create params[:task]
      render :json => task
  end

  private

  def load_lessonplan
      render :json => {status: :error} unless @lessonplan = Lessonplan.find_by_id(params[:lessonplan_id])
  end

end
