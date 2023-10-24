# Borra todos los registros existentes antes de crear nuevos registros
User.destroy_all
Vehicle.destroy_all
Appointment.destroy_all

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

# Crea 30 vehículos asociados a usuarios existentes y establece fechas de cita
users = User.all

30.times do
  user = users.sample
  vehicle = Vehicle.create(
    brand: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    plate_number: Faker::Vehicle.license_plate,
    user: user
  )

  # Establece una fecha de cita para el vehículo
  vehicle.create_appointment(appointment_date: Faker::Date.forward(days: 30))
end

puts "Seed data generated successfully!"
