# Crea 10 usuarios con datos ficticios
10.times do
  User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    role: "user"
  )
end

puts "Seed data generated successfully!"
