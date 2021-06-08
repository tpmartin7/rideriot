# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



admin = User.create(email: 'admin', password: '123456')

CycleRoute.create(
    name: "Victoria Park",
    start_point: "London E2 9JW",
    end_point: "London E20 1JB",
    user: admin
  )
