class PropertysController < ApplicationController
  before_action :authenticate_user!

  def index
    @propertys = Property.all
  end

  def new
    @property = Property.new
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

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to :action => 'index' #render 'propertys/index' # Handle a successful save.
    else
      redirect_to :action => 'new'  #render 'propertys/new' # handle a failed save
    end
  end


  def property_params
    params.require(:property).permit(:name)
  end


end
