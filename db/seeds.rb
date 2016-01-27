# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p1 = Property.create(name: 'propqweqweqwe1', numberunit: '12', street: 'blahbl blayh rd',suburb: 'emu' ,postcode: '2000',phone: '(45) 25254231',)

b1 = Booking.create(name: 'na', hours: 1.44, date: Time.now)

b1.property << [p1]


