21.times do |place|
  Place.create!(
    name: "Place to eat # #{place + 1}",
    address: "#{place + 1 } W Main Street, Peoria, AZ 85345",
    description: "The next best place to eat"
  )
  puts "Created place #{place + 1}"
end

# User.create!(
#   email: 'user@example.com',
#   password: 'password1',
#   password_confirmation: 'password1',
#   name: 'Regular User'
# )