class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      render 'index' # Handle a successful save.
    else
      render 'new'
    end
  end
  
  def show
    @job = Job.find(params[:id])
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:success] = "Job deleted"
    redirect_to '/jobs'
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(post_params)
      redirect_to action: :jobs
    else
      render 'jobs/edit'
    end
  end

  private

    def job_params
      params.require(:job).permit(:name, :start_date, :end_date)
    end
end
