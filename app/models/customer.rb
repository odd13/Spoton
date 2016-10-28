class Customer < ActiveRecord::Base
  has_many :locations, dependent: :destroy
  has_many :bookings
  has_many :users
end
