class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    jobbookings
    @job_to_schedule_bookings =
      Booking.where([' task_id != ? and booked_time IS NULL', 4])
    @quote_bookings = Booking.where([' task_id = ?', 4])
    @completed_bookings = Booking.where([' end_datetime IS NOT NULL'])
  end

  def new
    @booking = Booking.new
  end

  def todays
    @bookings = Booking.where(
      ['booked_time > ? and booked_time < ?',
       Time.zone.now.beginning_of_day,
       Time.zone.now.end_of_day]
    )
  end

  def quotes
    @quotebookings = Booking.where([' task_id = ?', 4])
  end

  def completed_bookings
    @completedbookings = Booking.where([' end_datetime IS NOT NULL'])
  end

  def invoices
    @bookings = Booking.where(
      ['booked_time > ? and booked_time < ?',
       Time.zone.now.beginning_of_day,
       Time.zone.now.end_of_day]
    )
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

  def startjob
    @booking = Booking.find(params[:id])
    if @booking.update_attribute(:start_datetime, DateTime.now)
      redirect_to :back
    else
      render 'bookings/todays'
    end
  end

  def endjob
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

  def jobbookings
    @job_bookings = Booking.where(
      [' task_id != ? and booked_time IS NOT NULL',
       4]
    )
  end

  def booking_params
    params.require(:booking).permit(
      :name, :hours, :booked_time, :customer_id,
      :task_id, :location_id, :start_datetime, :description, :externalref
    )
  end
end
