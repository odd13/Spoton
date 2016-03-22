# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# users
User.create! :name => 'Garry Danger', :email => 'garrydanger@gmail.com', :password => 'bobafett', :password_confirmation => 'bobafett'
User.create! :name => 'Oddie', :email => 'arcadeoddie@gmail.com', :password => 'bobafett', :password_confirmation => 'bobafett'

p1 = Property.create(name: 'propqweqweqwe1', numberunit: '12', street: 'blahbl blayh rd',suburb: 'emu' ,postcode: '2000',phone: '(45) 25254231',)
p2 = Property.create(name: 'propq2', numberunit: '1232', street: 'blahyh rd',suburb: 'eqwemu' ,postcode: '2000',phone: '(45) 2qweqwe5254231',)


b1 = Booking.create(name: 'na', hours: 1.44, date: Time.now, property: p1)
b2 = Booking.create(name: 'na', hours: 1.44, date: Time.now, property: p1)
b3 = Booking.create(name: 'na', hours: 1.44, date: Time.now, property: p1)
b4 = Booking.create(name: 'na', hours: 1.44, date: Time.now, property: p2)
#b1.property << [p1]


