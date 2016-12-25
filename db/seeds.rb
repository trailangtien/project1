User.create!(name: "phuong",
  email: "thaiphuong11dt1@gmail.com",
  password: "111111",
  password_confirmation: "111111",
  is_admin: true,
  address: "Nghe an",
  phone: "01688576549"
)

20.times do |n|
  name  = Faker::Name.name
  email = "example#{n + 1}@gamil.com"
  password = "111111"
  is_admin = "false"
  address = "tien bong #{n+1}"
  phone = "03243433343"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              is_admin:              is_admin,
              address:               address,
              phone:                 phone
             )
end

