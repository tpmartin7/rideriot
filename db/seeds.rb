# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admin = User.create(email: 'admin@rideriot.club', password: '123456') unless admin = User.find_by_email('admin@rideriot.club')

if CycleRoute.count < 4
  CycleRoute.create(
      name: "Victoria Park",
      start_point: "London E2 9JW",
      end_point: "London E20 1JB",
      user: admin
    )
  CycleRoute.create(
      name: "Regents Canal",
      start_point: "283a Kingsland Rd, London E2 8AS",
      end_point: "139 Graham St, London N1 8LB",
      user: admin
    )
  CycleRoute.create(
      name: "CS1",
      start_point: "16 Whitmore Rd, London N1 5QA",
      end_point: "Finsbury Circus, London EC2M 7DT",
      user: admin
    )
  CycleRoute.create(
      name: "Tower of London",
      start_point: "119 Shoreditch High St, London E1 6JN",
      end_point: "London EC3N 4AB",
      user: admin
  )
end
