# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'faker'
require "open-uri"

  # Remember you shouldnt destroy in the seed file in normal circumstances.

Review.destroy_all
RouteTag.destroy_all
CycleRoute.destroy_all
Tag.destroy_all
User.destroy_all
Location.destroy_all


admin = User.create!(email: 'admin@rideriot.club', password: '123456', name: "Kiz", points: 0, routes_completed: 0, distance_cycled: 0) unless admin = User.find_by_email('admin@rideriot.club')
kiz = URI.open('https://res.cloudinary.com/duae8ljpg/image/upload/v1623687480/rideriot/kieryn_o9alpo.jpg')
admin.photo.attach(io: kiz, filename: "kiz.jpg", content_type: 'image/jpg')
  # Remember you shouldnt destroy in the seed file in normal circumstances.
tags = {
  scenic: Tag.new(name: 'Scenic'),
  quiet: Tag.new(name: 'Quiet'),
  historic: Tag.new(name: 'Historic'),
  challenging: Tag.new(name: 'Challenging')
}

tags.each_value { |tag| tag.save }

cycle_routes = {
  vicPark: CycleRoute.new(
    name: "Victoria Park",
    start_point: "Goodrich House, Sewardstone Road, London",
    end_point: "East Village, Stratford, London",
    map_image: "rideriot/vicMap_ndt8xg.png",
    total_distance: 2.5,
    description: "Winner of the Green Flag award for the best UK park for the previous two years. The internal roadway is wide enough for people to cycle, walk and jog in the same space.",
    user: admin
  ),
  regents: CycleRoute.new(
    name: "Regents Canal",
    start_point: "139 Graham St, N1 8LB, London",
    end_point: "84 Victoria Park Rd E9 7JL",
    map_image: "rideriot/regentsMap_zrldo1.png",
    total_distance: 1.2,
    description: "One of London’s best-kept secrets. Take in scenic views and miss out the congestion, crowds and noise.",
    user: admin
  ),
  cs1: CycleRoute.new(
    name: "CS1",
    start_point: "Finsbury Circus, EC2M 7DT, London",
    end_point:  "Finsbury Circus, EC2M 7DT, London",
    map_image: "rideriot/cs1Map_lqarfs.png",
    total_distance: 1.5,
    description: "London's first Cycle Superhighway is a great way to explore London on roads you probably won't have used on a bike before.",
    user: admin
  ),
  tower: CycleRoute.new(
    name: "Tower of London",
    start_point: "Tower of London, London EC3N 4AB",
    end_point: "Montfichet Rd E20 1EJ",
    map_image: "rideriot/towerMap_qsrsdt.png",
    total_distance: 1.8,
    description: "The Tower of London has played a prominent role in English history, and is one of the country's most popular tourist attractions. ",
    user: admin
  )
}

cycle_routes.each_value { |cycle_route| cycle_route.save }

vic_park = CycleRoute.find_by(name: 'Victoria Park')
location = Location.new(name: 'New Spitalfields Market', address: '23 Sherrin Road E10 5SQ London', description: 'Britain’s premier wholesale fruit, vegetable and flower market', cycle_route_id: vic_park.id)
location.save
location = Location.new(name: 'Walthamstow Wetlands', address: '2 Forest Road N17 9NH London', description: 'In the Lee Valley a cluster of reservoirs have been transformed into Europe’s largest urban wetland reserve', cycle_route_id: vic_park.id)
location.save
location = Location.new(name: 'Bahasa', address: '116 Columbia Road E2 7RG London', description: 'Englands Hidden gems, the best premium guide Englands & Londons Independent Culture, Lifestyle & Local knowledge', cycle_route_id: vic_park.id)
location.save
location = Location.new(name: 'By the Bridge Cafe', address: '91 Brick Lane E1 6QL London', description: "A microcosm of London's shifting ethnic patterns, the area around Brick Lane in East London was once associated with poor slums and the scene of the crime for the Jack the Ripper murders.", cycle_route_id: vic_park.id)
location.save

regents_canal = CycleRoute.find_by(name: 'Regents Canal')
location = Location.new(name: 'Spitalfields', address: '283a Kingsland Rd E2 8AS London', description: 'Newly opened in 2014, By the Bridge hopes to bring people together with a hankering for coffee and an appreciation for quality service and a warm smile!', cycle_route_id: regents_canal.id)
location.save

cs1 = CycleRoute.find_by(name: 'CS1')
location = Location.new(name: 'Bloomsbury House', address: '40 Great Russell Street WC1B 3DA London', description: 'Bloomsbury House is an historic Grade II listed building conveniently located between Holborn and Russel Sqaure. The house was built in 1887.', cycle_route_id: cs1.id)
location.save
location = Location.new(name: 'Emirates Stadium', address: '117 Benwell Road N7 7BW London', description: 'The Emirates Stadium is a football stadium in Highbury, England, and the home of Arsenal.', cycle_route_id: cs1.id)
location.save
location = Location.new(name: 'London Bike Kitchen', address: '16 Whitmore Road N1 5QA London', description: 'The London Bike Kitchen is a mechanic owned & operated open DIY workshop where you can work on your own bike instead of giving it to someone else. Consider us a Do-It-Together education space.', cycle_route_id: cs1.id)
location.save

tower_of_london = CycleRoute.find_by(name: 'Tower of London')
location = Location.new(name: 'Spitalfields', address: '56 Brushfield Street E1 6AA London', description: 'At its heart, Spitalfields ‘Traders’ Market is an uncompromising array of independent stall holders, showcasing incredible hand-crafted and hard-to-find pieces that make every trip special and memorable.', cycle_route_id: tower_of_london.id)
location.save
location = Location.new(name: 'Saint Mary Axe', address: 'St Mary Axe E15 2SN London', description: 'St Mary Axe was a medieval parish in the City of London whose name survives as that of the street which formerly occupied it.', cycle_route_id: tower_of_london.id)
location.save
location = Location.new(name: 'Victoria Park', address: '64 Chisenhale Rd Bow E3 5QZ London', description: "Victoria Park is a park and is one of London's most visited green spaces with approximately 9 million visitors every year.", cycle_route_id: tower_of_london.id)
location.save

RouteTag.create(cycle_route: cycle_routes[:vicPark], tag: tags[:scenic])
RouteTag.create(cycle_route: cycle_routes[:vicPark], tag: tags[:quiet])
RouteTag.create(cycle_route: cycle_routes[:regents], tag: tags[:scenic])
RouteTag.create(cycle_route: cycle_routes[:cs1], tag: tags[:quiet])
RouteTag.create(cycle_route: cycle_routes[:tower], tag: tags[:historic])

@rand_review = ['Pretty good cycle', Faker::Hacker.say_something_smart, 'unimpressed, I hit a bus :(', Faker::ChuckNorris.fact, 'Great!', 'Very pretty']
@route_ids = CycleRoute.ids.map(&:to_i)

5.times do
  @user = User.new(name: Faker::FunnyName.name, points: rand(0..90), password: "123456", email: Faker::Internet.email, routes_completed: rand(0..10), distance_cycled: rand(0.40))
  @user.save!

  4.times do
    review = Review.new(comment: @rand_review.sample, rating: rand(0..5), cycle_route_id: @route_ids.sample, user_id: @user.id)
    review.save!
  end
end


