class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.belongs_to :customer, index:true
      t.belongs_to :location, index:true
      t.belongs_to :user, index:true
      t.belongs_to :task, index:true

      t.string :name
      t.float :hours
      t.timestamp :booked_time
      t.timestamp :start_datetime
      t.timestamp :end_datetime

      t.timestamps null: false
    end
  end
end
