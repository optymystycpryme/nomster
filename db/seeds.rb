User.create!(
  email: 'user@example.com',
  password: '12345678',
  password_confirmation: '12345678',
  username: 'FakeUser'
)
puts "User created"

21.times do |place|
  Place.create!(
    name: "Place to eat # #{place + 1}",
    address: "#{place + 1 } W Main Street, Peoria, AZ 85345",
    description: "The next best place to eat",
    user_id: 1
  )
  puts "Created place #{place + 1}"
end