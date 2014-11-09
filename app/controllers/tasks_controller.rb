class TasksController < ApplicationController
  def index
    @resources = Resource.all
    @minute_breakdown = Task::MINUTE_BREAKDOWN
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.goal_ids = params[:task][:goal_ids]
    @task.resource_ids = params[:task][:resource_ids]
    if @task.save
      redirect_to @task
    else
      render :new
    end
  end

  def fart_around
    @task = Task.fart_around.to_json
    render json: @task
  end

  def search
    @task = Task.select_a_set(search_params)
    if @task
      redirect_to @task
    else
      flash[:notice] = "Nothing found!"
      redirect_to :root
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :minutes, :site)
  end

  def search_params
    params.permit(:minutes, :resource)
  end
end
