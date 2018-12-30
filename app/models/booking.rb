class Booking < ActiveRecord::Base
  belongs_to :customer
  belongs_to :location
  belongs_to :task
  belongs_to :user

  validate :not_booking_in_the_past #BookingValidator, fields: [:booked_time]

  scope :for_today, -> { where(
                  ['booked_time > ? and booked_time < ?',
                  Time.zone.now.beginning_of_day,
                  Time.zone.now.end_of_day]
                  ).order(:end_datetime) }
  scope :quotes, -> { where (['task_id = ?', 4]) }
  scope :invoiced, -> { where([' end_datetime IS NOT NULL']) }
  scope :to_invoice, -> { where([' end_datetime IS NULL']) }
  scope :unscheduled, -> { where([' task_id != ? and booked_time IS NULL', 4]) }
  scope :scheduled, -> { where(['task_id != ? and booked_time IS NOT NULL', 4]) }

  def work_has_started
    start_datetime != nil
  end

  def work_has_ended
    end_datetime != nil
  end

  def in_progress
    return work_has_started unless work_has_started
    work_has_ended == false
  end

  def not_booking_in_the_past
    if booked_time < Time.now()
      errors[:booked_time] << "Unable to create booking in the past"
    end
  end
end
