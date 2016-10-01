class BookingsController < ApplicationController
  def index
    #@bookings = Booking.where("customer_id = ?", params[current_user.custome$
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  # this is a great comment
  def create
    #@booked_time = DateTime.new(2012, 8, 29, 23, 59, 59)
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to :action => 'index' #render 'bookings/index' # Handle a succe$
    else
      redirect_to :action => 'new'  #render 'bookings/new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:success] = "Booking deleted"
    redirect_to '/bookings'
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      @booking.save
      redirect_to action: :index
    else
      render 'bookings/edit'
    end
  end

  private

    def booking_params
      params.require(:booking).permit(:name, :hours, :booked_time, :task_id, :location_id, :start_datetime)
    end


end
