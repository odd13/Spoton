class AddExternalrefToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :externalref, :string
  end
end
