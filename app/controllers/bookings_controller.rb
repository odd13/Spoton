class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = Booking.all
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

end
