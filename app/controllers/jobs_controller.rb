class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def todays
    @jobs = Job.where("created_at >= ?", Time.zone.now.beginning_of_day) 
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to :action => 'index' #render 'jobs/index' # Handle a successful save.
    else
      redirect_to :action => 'new'  #render 'jobs/new'
    end
  end

#When the job is started update the start_date
  def startjob
    @job = Job.find(params[:id])
    if @job.update(start_date)
      redirect_to action: :todays_jobs
    else
      render 'jobs/todays'
    end
  end


  def endjob

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
    if @job.update(job_params)
      redirect_to action: :index
    else
      render 'jobs/edit'
    end
  end

  private

    def job_params
      params.require(:job).permit(:name, :start_date, :end_date, :description)
    end
end
