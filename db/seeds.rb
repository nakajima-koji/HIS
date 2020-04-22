User.create!(name: "こうた",
             email: "sample@email.com",
             size: 'M')

60.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  User.create!(name: name,
               email: email,
               size: "110")
end