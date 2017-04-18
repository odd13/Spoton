class TypesController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Type.all
  end

  def new
    @task = Type.new
  end

  def create
    @task = Type.new(task_params)
    if @task.save
      redirect_to action: 'index'
    else
      redirect_to action: 'new'
    end
  end

  def show
    @task = Type.find(params[:id])
  end

  def destroy
    @task = Type.find(params[:id])
    @task.destroy
    flash[:success] = 'Type deleted'
    redirect_to '/tasks'
  end

  def edit
    @task = Type.find(params[:id])
  end

  def update
    @task = Type.find(params[:id])
    if @task.update(task_params)
      @task.save
      redirect_to action: :index
    else
      render 'tasks/edit'
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :category)
  end
end
