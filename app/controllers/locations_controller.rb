class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to action: 'index'
    else
      redirect_to action: 'new'
    end
  end

  def show
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    flash[:success] = 'Location deleted'
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
