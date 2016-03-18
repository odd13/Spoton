class PropertysController < ApplicationController
  before_action :authenticate_user!

  def index
    @propertys = Property.all
  end

  def show
    @propertys = Property.find(params[:id])
    @bookings = @property.bookings
  end
  def edit
    @property = Property.find(params[:id])
  end
  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    flash[:success] = "Property deleted"
    redirect_to '/propertys'
  end
  def showthing
    return "hello mate"
  end

end
