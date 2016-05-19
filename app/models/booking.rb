class Booking < ActiveRecord::Base
	belongs_to :location
	belongs_to :task
	belongs_to :user
end
