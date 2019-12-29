User.create!(
  email: 'user@example.com',
  password: '12345678',
  password_confirmation: '12345678',
  username: 'FakeUser'
)
puts "User created"

User.create!(
  email: 'user2@example.com',
  password: '12345678',
  password_confirmation: '12345678',
  username: 'FakeUser2'
)
puts "User 2 created"

10.times do |place|
  Place.create!(
    name: "Place to eat # #{place + 1}",
    address: "#{place + 1 } W Main Street, Peoria, AZ 85345",
    description: "The # #{place + 1} best place to eat",
    user_id: 1
  )
  puts "Created place #{place + 1}"
end

10.times do |picture|
  Photo.create!(
    picture: Rails.root.join("app/assets/images/place_images/image#{rand(1..5)}.jpg").open,
    caption: "Image # #{picture + 1}",
    user_id: 1,
    place_id: picture + 1
  )
  puts "Image # #{picture + 1} created!"
end