# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# users

#User.create! :name => 'Garry Danger', :email => 'garrydanger@gmail.com', :password => 'bobafett', :password_confirmation => 'bobafett'
#User.create! :name => 'Oddie', :email => 'arcadeoddie@gmail.com', :password => 'bobafett', :password_confirmation => 'bobafett'
#User.create! :name => 'rob', :email => 'robert.ofarrell@gmail.com', :password => 'bobafett2', :password_confirmation => 'bobafett2'

c1 = Customer.create(name: "first cus", address: "1 address", suburb: "sub", state: "nsw", postcode: "2584",country: "aus",email: "blah@blag",phone: "1212")

Location.create(name: "Beaches", address: "1 address", customer_id: c1.id )
Location.create(name: "Beaches", address: "1 address", customer_id: c1.id )
Location.create(name: "Beaches", address: "1 address", customer_id: c1.id )
