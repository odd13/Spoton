class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
	t.belongs_to :property, index:true
	t.belongs_to :user, index:true
      t.string :name
      t.float :hours
      t.timestamp :date

      t.timestamps null: false
    end
  end
end
