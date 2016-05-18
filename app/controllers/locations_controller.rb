class LocationsController < ApplicationController
  before_action :authenticate_user!

  def index
    #@locations = Location.where("customer_id = ?", params[current_user.customer_id])
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to :action => 'index' #render 'locations/index' # Handle a successful save.
    else
      redirect_to :action => 'new'  #render 'locations/new'
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    flash[:success] = "Location deleted"
    redirect_to '/locations'
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(location_params)
      @location.save
      redirect_to action: :index
    else
      render 'locations/edit'
    end
  end

  private

    def location_params
      params.require(:location).permit(:name, :address, :customer_id)
    end
end
