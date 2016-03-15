class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end
  def new
  end

  def create
    render plain: params[:article].inspect
  end
end
