class TasksController < ApplicationController
  def index
    @resources = Resource.all
  end

  def new
    @task = Task.new
  end

  def create
    if params[:super_secret_code] == env[SUPER_SECRET_CODE]

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

  def search_params
    params.permit(:minutes, :resource)
  end
end
