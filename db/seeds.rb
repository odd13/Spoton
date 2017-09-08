c1 = Customer.create(
  name: 'Jim A',
  address: '1 address',
  suburb: 'sub',
  state: 'nsw',
  postcode: '2584',
  country: 'aus',
  email: 'blah@blag',
  phone: '1212'
)

c2 = Customer.create(
  name: 'A1 Realestate',
  address: '1 address',
  suburb: 'sub',
  state: 'nsw',
  postcode: '2584',
  country: 'aus',
  email: 'blah@blag',
  phone: '1212'
)

c3 = Customer.create(
  name: 'Cutcliff',
  address: '1 address',
  suburb: 'sub',
  state: 'nsw',
  postcode: '2584',
  country: 'aus',
  email: 'blah@blag',
  phone: '1212'
)

User.create! name: 'Garry Danger', email: 'garrydanger@gmail.com',
             password: 'bobafett', password_confirmation: 'bobafett',
             customer_id: c1
User.create! name: 'Oddie', email: 'arcadeoddie@gmail.com',
             password: 'bobafett', password_confirmation: 'bobafett',
             customer_id: c1
User.create! name: 'rob', email: 'robert.ofarrell@gmail.com',
             password: 'bobafett2', password_confirmation: 'bobafett2',
             customer_id: c1
User.create! name: 'Oddie2', email: 'arcadeoddie2@gmail.com',
             password: 'bobafett', password_confirmation: 'bobafett',
             customer_id: c2

Location.create(name: 'Calypso', address: '1 Calypso st', customer_id: c1.id)
Location.create(name: 'Blaxland', address: '1 Great Western Highway',
                customer_id: c1.id)
Location.create(name: 'Emu Plains', address: '1 Russell st', customer_id: c2.id)
Location.create(name: 'Emu Plains', address: '11 River Rd', customer_id: c3.id)

Task.create(name: 'Mowing', description: 'Mowing and wipper snipping')
Task.create(name: 'General Maintenance', description: 'General Maintenance')
Task.create(name: 'Building', description: 'Building')
Task.create(name: 'Quote', description: 'Quote')
