User.create!(name: "こうた",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             size: 'M',
             admin: true)

60.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  Request.create!(name: name,
                  email: email,
                  size: "110",
                  address: "obihirosi",
                  user_id: "1")
end