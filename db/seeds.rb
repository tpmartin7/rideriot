# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admin = User.create(email: 'admin@rideriot.club', password: '123456') unless admin = User.find_by_email('admin@rideriot.club')

  # Remember you shouldnt destroy in the seed file in normal circumstances.
RouteTag.destroy_all
CycleRoute.destroy_all
Tag.destroy_all
  # Remember you shouldnt destroy in the seed file in normal circumstances.
tag_names = %w[Scenic Quiet Historic Challenging]
tags = []
tag_names.each do |tag_name|
  tags << Tag.new(name: tag_name)
end
tags.each { |tag| tag.save }

cycle_routes = []

cycle_routes << CycleRoute.new(
    name: "Victoria Park",
    start_point: "Goodrich House, Sewardstone Road, London",
    end_point: "East Village, Stratford, London",
    user: admin
  )
cycle_routes << CycleRoute.new(
    name: "Regents Canal",
    start_point: "283a Kingsland Rd, London E2 8AS",
    end_point: "139 Graham St, London N1 8LB",
    user: admin
  )
cycle_routes << CycleRoute.new(
    name: "CS1",
    start_point: "16 Whitmore Rd, London N1 5QA",
    end_point: "Finsbury Circus, London EC2M 7DT",
    user: admin
  )
cycle_routes << CycleRoute.new(
    name: "Tower of London",
    start_point: "119 Shoreditch High St, London E1 6JN",
    end_point: "Tower of London, London EC3N 4AB",
    user: admin
  )

cycle_routes.each do |cycle_route|
  cycle_route.save
  RouteTag.create(cycle_route: cycle_route, tag: tags.sample)
end
