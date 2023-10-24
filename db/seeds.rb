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

# Crea 30 vehículos asociados a usuarios existentes
users = User.all

30.times do
  Vehicle.create(
    brand: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    plate_number: Faker::Vehicle.license_plate,
    user: users.sample
  )
end

puts "Seed data generated successfully!"
