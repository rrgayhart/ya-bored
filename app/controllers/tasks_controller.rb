class TasksController < ApplicationController
  def index

  end

  def fart_around
    @task = Task.fart_around.to_json
    render json: @task
  end
end
