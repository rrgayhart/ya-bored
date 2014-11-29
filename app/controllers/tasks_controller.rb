class TasksController < ApplicationController
  def home
    @resources = Resource.all
    @minute_breakdown = Task::MINUTE_BREAKDOWN
  end

  def index
    @tasks = Task.order(:created_at).paginate(:page => params[:page])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      redirect_to @task
    else
      redirect_to @task
    end
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
    resource_ids = params[:resource][:resource_ids]
    @task = Task.select_a_set(search_params, resource_ids)
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

  def completed_index
    inactive = Task.inactive
    @tasks = inactive.limit(20)
    @total_task_count = inactive.count
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :minutes, :site, :completed)
  end

  def search_params
    params.permit(:minutes)
  end
end
