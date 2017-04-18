class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to action: 'index'
    else
      redirect_to action: 'new'
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = 'Task deleted'
    redirect_to '/tasks'
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      @task.save
      redirect_to action: :index
    else
      render 'tasks/edit'
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
