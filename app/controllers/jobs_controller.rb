class JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def todays
    @jobs = Job.where("booked_time > ? and booked_time < ?", Time.zone.now.beginning_of_day, Time.zone.now.ending_of_day)
  end

  #ToDo: Need to add a field for indication of being emailed. Just for testing
  def emailview
    @jobs = Job.where("end_date IS NOT NULL and start_date >= ?", Time.zone.now.beginning_of_day)
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
    if @job.update_attribute(:start_date, DateTime.now) ## ------&& @job.update_attribute(:start_user_id, current_user.id)
      redirect_to :back
    else
      render 'jobs/todays'
    end
  end


  def endjob
    @job = Job.find(params[:id])
    if @job.update_attribute(:end_date, DateTime.now)
      redirect_to :back
    else
      render 'jobs/todays'
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
    if @job.update(job_params)
      @job.save
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
