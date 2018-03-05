class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to action: 'index'
    else
      redirect_to action: 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    flash[:success] = 'Booking deleted'
    redirect_to bookings_path
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

  def new
    @booking = Booking.new
  end

  def start_work
    @booking = Booking.find(params[:id])
    if @booking.update_attribute(:start_datetime, DateTime.now)
      redirect_to :back
    else
      render 'bookings/todays'
    end
  end

  def end_work
    @booking = Booking.find(params[:id])
    if @booking.update_attribute(:end_datetime, DateTime.now)
      redirect_to :back
    else
      render 'bookings/todays'
    end
  end

  # TODO: Need to add a field for indication of being emailed. Just for testing
  def emailview
    @bookings = Booking.where(
      ['end_datetime IS NOT NULL and booked_time > ? and booked_time < ?',
       Time.zone.now.beginning_of_day,
       Time.zone.now.end_of_day]
    )
  end


  private

  def booking_params
    params.require(:booking).permit(
      :name, :hours, :booked_time, :customer_id,
      :task_id, :location_id, :start_datetime, :description, :externalref
    )
  end
end
