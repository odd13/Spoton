require "spec_helper"

describe 'when creating a booking' do
  let(:booking_in_the_past) { Booking.new(booked_time: Date.today - 1.days) }

  it 'cannot be in the past' do
    expect(booking_in_the_past).to_not be_valid
  end
end
