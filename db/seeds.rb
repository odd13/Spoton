# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# users

#User.create! :name => 'Garry Danger', :email => 'garrydanger@gmail.com', :password => 'bobafett', :password_confirmation => 'bobafett'
#u1 = User.create! :name => 'Oddie', :email => 'arcadeoddie@gmail.com', :password => 'bobafett', :password_confirmation => 'bobafett'
#User.create! :name => 'rob', :email => 'robert.ofarrell@gmail.com', :password => 'bobafett2', :password_confirmation => 'bobafett2'

#u1 = User.create! :name => 'Oddie1', :email => 'arcadeoddie1@gmail.com', :password => 'bobafett', :password_confirmation => 'bobafett'
#u2 = User.create! :name => 'Oddie2', :email => 'arcadeoddie2@gmail.com', :password => 'bobafett', :password_confirmation => 'bobafett'




c1 = Customer.create(name: "first cus", address: "1 address", suburb: "sub", state: "nsw", postcode: "2584",country: "aus",email: "blah@blag",phone: "1212")
c2 = Customer.create(name: "Second cus", address: "1 address", suburb: "sub", state: "nsw", postcode: "2584",country: "aus",email: "blah@blag",phone: "1212")
c3 = Customer.create(name: "third cus", address: "1 address", suburb: "sub", state: "nsw", postcode: "2584",country: "aus",email: "blah@blag",phone: "1212")

User.create! :name => 'Garry Danger', :email => 'garrydanger@gmail.com', :password => 'bobafett', :password_confirmation => 'bobafett', :customer_id =>c1
u1 = User.create! :name => 'Oddie', :email => 'arcadeoddie@gmail.com', :password => 'bobafett', :password_confirmation => 'bobafett', :customer_id =>c1
User.create! :name => 'rob', :email => 'robert.ofarrell@gmail.com', :password => 'bobafett2', :password_confirmation => 'bobafett2', :customer_id =>c1

#u1 = User.create! :name => 'Oddie1', :email => 'arcadeoddie1@gmail.com', :password => 'bobafett', :password_confirmation => 'bobafett'
u2 = User.create! :name => 'Oddie2', :email => 'arcadeoddie2@gmail.com', :password => 'bobafett', :password_confirmation => 'bobafett', :customer_id =>c2



Location.create(name: "Beaches", address: "1 address", customer_id: c1.id )
Location.create(name: "Baasasasasas", address: "1 address", customer_id: c1.id )
Location.create(name: "Buuuhjdhksjdhk", address: "1 address", customer_id: c2.id )
