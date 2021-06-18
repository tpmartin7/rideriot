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


admin = User.create!(email: 'admin@rideriot.club', password: '123456', name: "Tim", points: 0, routes_completed: 0, distance_cycled: 0) unless admin = User.find_by_email('admin@rideriot.club')
kiz = URI.open('https://res.cloudinary.com/duae8ljpg/image/upload/v1624010629/rideriot/timAvatarCropped_kf7dkl.jpg')
admin.photo.attach(io: kiz, filename: "kiz.jpg", content_type: 'image/jpg')
  # Remember you shouldnt destroy in the seed file in normal circumstances.
tags = {
  scenic: Tag.new(name: 'Scenic'),
  quiet: Tag.new(name: 'Quiet'),
  historic: Tag.new(name: 'Historic'),
  challenging: Tag.new(name: 'Challenge')
}

tags.each_value { |tag| tag.save! }

cycle_routes = {
  vicPark: CycleRoute.new(
    name: "Cruise through Victoria Park",
    start_point: "Goodrich House, Sewardstone Road, London",
    end_point: "East Village, Stratford, London",
    map_image: "rideriot/victoria-park_dlrspq.png",
    total_distance: 2.5,
    description: "Winner of the Green Flag award for the best UK park for the previous two years. The internal roadway is wide enough for people to cycle, walk and jog in the same space.",
    user: admin
  ),
  regents: CycleRoute.new(
    name: "Regents Canal Towpath",
    start_point: "139 Graham St, N1 8LB, London",
    end_point: "84 Victoria Park Rd E9 7JL",
    map_image: "rideriot/regents-canal_hh7vy5.png",
    total_distance: 1.2,
    description: "One of London’s best-kept secrets. Take in scenic views and miss out the congestion, crowds and noise.",
    user: admin
  ),
  cs1: CycleRoute.new(
    name: "London's First Cycle Highway",
    start_point: "Finsbury Circus, EC2M 7DT, London",
    end_point:  "Finsbury Circus, EC2M 7DT, London",
    map_image: "rideriot/cs1_h7imcn.png",
    total_distance: 1.5,
    description: "London's first Cycle Superhighway is a great way to explore London on roads you probably won't have used on a bike before.",
    user: admin
  ),
  tower: CycleRoute.new(
    name: "See the Tower of London",
    start_point: "Tower of London, London EC3N 4AB",
    end_point: "Montfichet Rd E20 1EJ",
    map_image: "rideriot/tower-of-london-east_sgkyhm.png",
    total_distance: 1.8,
    description: "The Tower of London has played a prominent role in English history, and is one of the country's most popular tourist attractions.",
    user: admin
  ),
  battersea: CycleRoute.new(
    name: "Battersea Park",
    start_point: "36 Albert Bridge Rd, London SW11 4PY",
    end_point: "72 Hyde Vale, London SE10 8HP",
    map_image: "rideriot/battersea-park_b3cnqc.png",
    total_distance: 9.9,
    description: "Take a spin along the Thames and spot the who’s who of London’s riverside landmarks",
    user: admin
  ),
  limehouse: CycleRoute.new(
    name: "Limehouse Basin",
    start_point: "Goodhart Place, E14 8BT London",
    end_point: "London Fields West Side, London E8 3EU",
    map_image: "rideriot/limehouse-basin_p7bblk.png",
    total_distance: 3.7,
    description: "The Limehouse is a gateway between the River Thames and over 2,000 miles of navigable canals and rivers. It is the oldest canal in London.",
    user: admin
  ),
  big_ben: CycleRoute.new(
    name: "Big Ben",
    start_point: "Parliament Square, London SW1P 3JX",
    end_point: "20 Deans Yd, London SW1P 3PA",
    map_image: "rideriot/big-ben_nedcyi.png",
    total_distance: 23,
    description: "Take a right-of-passage risk with a brisk loop around one of London’s favourite cycling spots. The Big Ben to Richmond Park Loop!",
    user: admin
  ),
  finsbury: CycleRoute.new(
    name: "Finsbury Park",
    start_point: "Station Pl, Finsbury Park, London N4 2DH",
    end_point: "148 Dukes Ave, London N10 2QB",
    map_image: "rideriot/finsbury-park_xgzshi.png",
    total_distance: 3.7,
    description: "Leave London behind (in your mind) and embrace nature on the route connecting two of north London’s most loved parks.",
    user: admin
  ),
  regents_park: CycleRoute.new(
    name: "Regents Park Circular",
    start_point: "11 St Andrews Pl, London NW1 4LE",
    end_point: "9 Cambridge Terrace, London NW1 4JL",
    map_image: "rideriot/regents-park-circular_qaztna.png",
    total_distance: 2.4,
    description: "More of a loop than a route, the parameter of Regent’s Park is a great part of London to practice race intervals and pick up some speed.",
    user: admin
  ),
  tower_london: CycleRoute.new(
    name: "Tower of London West",
    start_point: "Tower of London, London EC3N 4AB",
    end_point: "London SW1A 0AA",
    map_image: "rideriot/tower-of-london-west_d6exys.png",
    total_distance: 3.1,
    description: "Definitely one of the most sightseeing-packed routes in the world, this riverside ride takes in more of the capital’s icons than you can shake a ‘I love London’ snow globe at.",
    user: admin
  ),
  hyde_park_loop: CycleRoute.new(
    name: "Hyde Park Loop",
    start_point: "499 - 517 Oxford St, London W1K 7DA",
    end_point: "Buckingham Palace, London SW1A 1AA",
    map_image: "rideriot/hyde-park-loop_yj1oe8.png",
    total_distance: 4.5,
    description: "Fun fact: nine of the top 10 journeys made on Santander bikes start and end in Hyde Park. This journey takes you around Hyde Park finishing at Buckingham Palace",
    user: admin
  ),
}
cycle_routes.each_value { |cycle_route| cycle_route.save! }

locations = {
  new_spitalfields_market: Location.new(
    name: 'New Spitalfields Market',
    address: '23 Sherrin Road E10 5SQ London',
    description: 'Britain’s premier wholesale fruit, vegetable and flower market',
    cycle_route_id: cycle_routes[:vicPark].id
  ),
  walthamstow_wetlands: Location.new(
    name: 'Walthamstow Wetlands',
    address: '2 Forest Road N17 9NH London',
    description: 'In the Lee Valley a cluster of reservoirs have been transformed into Europe’s largest urban wetland reserve',
    cycle_route_id: cycle_routes[:vicPark].id
  ),
  bahasa: Location.new(
    name: 'Bahasa',
    address: '116 Columbia Road E2 7RG London',
    description: 'Englands Hidden gems, the best premium guide Englands & Londons Independent Culture, Lifestyle & Local knowledge',
    cycle_route_id: cycle_routes[:vicPark].id
  ),
  by_the_bridge_cafe: Location.new(
    name: 'By the Bridge Cafe',
    address: '91 Brick Lane E1 6QL London',
    description: "A microcosm of London's shifting ethnic patterns, the area around Brick Lane in East London was once associated with poor slums and the scene of the crime for the Jack the Ripper murders.",
    cycle_route_id: cycle_routes[:vicPark].id
  ),
  spitalfields: Location.new(
    name: 'Spitalfields',
    address: '283a Kingsland Rd E2 8AS London',
    description: 'Newly opened in 2014, By the Bridge hopes to bring people together with a hankering for coffee and an appreciation for quality service and a warm smile!',
    cycle_route_id: cycle_routes[:regents].id
  ),
  bloomsbury_house: Location.new(
    name: 'Bloomsbury House',
    address: '40 Great Russell Street WC1B 3DA London',
    description: 'Bloomsbury House is an historic Grade II listed building conveniently located between Holborn and Russel Sqaure. The house was built in 1887.',
    cycle_route_id: cycle_routes[:cs1].id
  ),
  emirates: Location.new(
    name: 'Emirates Stadium',
    address: '117 Benwell Road N7 7BW London',
    description: 'The Emirates Stadium is a football stadium in Highbury, England, and the home of Arsenal.',
    cycle_route_id: cycle_routes[:cs1].id
  ),
  london_bike_kitchen: Location.new(
    name: 'London Bike Kitchen',
    address: '16 Whitmore Road N1 5QA London',
    description: 'The London Bike Kitchen is a mechanic owned & operated open DIY workshop where you can work on your own bike instead of giving it to someone else. Consider us a Do-It-Together education space.',
    cycle_route_id: cycle_routes[:cs1].id
  ),
  spit: Location.new(
    name: 'Spitalfields',
    address: '56 Brushfield Street E1 6AA London',
    description: 'At its heart, Spitalfields ‘Traders’ Market is an uncompromising array of independent stall holders, showcasing incredible hand-crafted and hard-to-find pieces that make every trip special and memorable.',
    cycle_route_id: cycle_routes[:tower].id
  ),
  saint_mary: Location.new(
    name: 'Saint Mary Axe',
    address: 'St Mary Axe E15 2SN London',
    description: 'St Mary Axe was a medieval parish in the City of London whose name survives as that of the street which formerly occupied it.',
    cycle_route_id: cycle_routes[:tower].id
  ),
  victoria_park: Location.new(
    name: 'Victoria Park',
    address: '64 Chisenhale Rd Bow E3 5QZ London',
    description: "Victoria Park is a park and is one of London's most visited green spaces with approximately 9 million visitors every year.",
    cycle_route_id: cycle_routes[:tower].id
  ),
  london_eye: Location.new(
    name: 'London Eye',
    address: "30 The Queen's Walk, London SE1 7JA",
    description: "The London Eye, or the Millennium Wheel, is a cantilevered observation wheel on the South Bank of the River Thames in London.",
    cycle_route_id: cycle_routes[:battersea].id
  ),
  globe: Location.new(
    name: 'Shakespeares Globe',
    address: '21 New Globe Walk, London SE1 9DT',
    description: "Shakespeare's Globe is a reconstruction of the Globe Theatre, an Elizabethan playhouse for which William Shakespeare wrote his plays.",
    cycle_route_id: cycle_routes[:battersea].id
  ),
  borough: Location.new(
    name: 'Borough Market',
    address: '8 Southwark St, London SE1 1TL',
    description: "Borough Market is a wholesale and retail market hall in Southwark, London, England. It is one of the largest and oldest food markets in London.",
    cycle_route_id: cycle_routes[:battersea].id
  ),
  mile_end: Location.new(
    name: 'Mile End Park',
    address: 'Clinton Rd, London E3 4QY',
    description: "Mile End Park is a linear park of some 32 hectares, and was created on industrial land devastated by World War II bombing.",
    cycle_route_id: cycle_routes[:limehouse].id
  ),
  pavilion: Location.new(
    name: 'Pavilion Cafe',
    address: 'Victoria Park, Old Ford Rd, London E9 7DE',
    description: "Stop at the legendary Pavilion Cafe on the edge of Victoria Park for a Victoria sponge.",
    cycle_route_id: cycle_routes[:limehouse].id
  ),
  battersea_station: Location.new(
    name: 'Battersea Power Station',
    address: 'Albert Bridge Rd, London SW11 4NU',
    description: "Battersea Power Station is a decommissioned coal-fired power station, located on the south bank of the River Thames.",
    cycle_route_id: cycle_routes[:big_ben].id
  ),
  richmond: Location.new(
    name: 'Richmond Park',
    address: "303 King's Rd, Kingston upon Thames KT2 5JJ",
    description: "Richmond Park was created by Charles I in the 17th century as a deer park. The largest of London's Royal Parks.",
    cycle_route_id: cycle_routes[:big_ben].id
  ),
  parkland: Location.new(
    name: 'Parkland Walk',
    address: "60, A1201, London N4 4SE",
    description: "Parkland Walk – a tree-lined track of an old disused railway. The only obstacles to dodge are the odd family strolls.",
    cycle_route_id: cycle_routes[:finsbury].id
  ),
  cir1: Location.new(
    name: 'Interval 1',
    address: "55 Park Rd, London NW1 6XU",
    description: "First checkpoint. Time to blitz the next one!",
    cycle_route_id: cycle_routes[:regents_park].id
  ),
  circ2: Location.new(
    name: 'Interval 2',
    address: "Outer Cir, London NW8 7LS",
    description: "Second checkpoint. Keep pushing!",
    cycle_route_id: cycle_routes[:regents_park].id
  ),
  circ3: Location.new(
    name: 'Interval 3',
    address: "4 St Katharine's Precinct, London NW1 4HH",
    description: "Last checkpoint. SPRINT!",
    cycle_route_id: cycle_routes[:regents_park].id
  ),
  thames: Location.new(
    name: 'The Thames',
    address: "lower thames street",
    description: "Passing the Monument on your right and The Shard, Shakespeare’s Globe and Tate Modern over the river to your left.",
    cycle_route_id: cycle_routes[:tower_london].id
  ),
  somerset: Location.new(
    name: 'Somerset House',
    address: "Strand, London WC2R 1LA",
    description: "Somerset House is a large Neoclassical complex situated on the south side of the Strand.",
    cycle_route_id: cycle_routes[:tower_london].id
  ),
  kensington: Location.new(
    name: 'Kensington Palace',
    address: "25 Kensington Palace Gardens, London W8 4QY",
    description: "Royal palace and gardens, with exhibits on former residents like Queen Victoria and Princess Diana.",
    cycle_route_id: cycle_routes[:hyde_park_loop].id
  ),
  albert_hall: Location.new(
    name: 'Royal Albert Hall',
    address: "Kensington Gore, South Kensington, London SW7 2AP",
    description: "One of Britain's great Victorian splendours, most famous for the Proms classical music festival.",
    cycle_route_id: cycle_routes[:hyde_park_loop].id
  ),
}

locations.each_value { |location| location.save! }

RouteTag.create!(cycle_route: cycle_routes[:vicPark], tag: tags[:scenic])
RouteTag.create!(cycle_route: cycle_routes[:vicPark], tag: tags[:quiet])
RouteTag.create!(cycle_route: cycle_routes[:regents], tag: tags[:scenic])
RouteTag.create!(cycle_route: cycle_routes[:cs1], tag: tags[:quiet])
RouteTag.create!(cycle_route: cycle_routes[:tower], tag: tags[:historic])
RouteTag.create!(cycle_route: cycle_routes[:battersea], tag: tags[:challenging])
RouteTag.create!(cycle_route: cycle_routes[:battersea], tag: tags[:historic])
RouteTag.create!(cycle_route: cycle_routes[:limehouse], tag: tags[:scenic])
RouteTag.create!(cycle_route: cycle_routes[:big_ben], tag: tags[:challenging])
RouteTag.create!(cycle_route: cycle_routes[:big_ben], tag: tags[:historic])
RouteTag.create!(cycle_route: cycle_routes[:big_ben], tag: tags[:scenic])
RouteTag.create!(cycle_route: cycle_routes[:finsbury], tag: tags[:scenic])
RouteTag.create!(cycle_route: cycle_routes[:finsbury], tag: tags[:quiet])
RouteTag.create!(cycle_route: cycle_routes[:regents_park], tag: tags[:challenging])
RouteTag.create!(cycle_route: cycle_routes[:tower_london], tag: tags[:historic])
RouteTag.create!(cycle_route: cycle_routes[:tower_london], tag: tags[:scenic])
RouteTag.create!(cycle_route: cycle_routes[:hyde_park_loop], tag: tags[:historic])
RouteTag.create!(cycle_route: cycle_routes[:hyde_park_loop], tag: tags[:scenic])

@rand_review = ['Pretty good cycle', "Beautify journey, leafy areas!", 'I had a lovely time cycling around London, will recommend', "Had a great time on this cycle until I ran into a parked car", 'Great!', 'Very pretty route', 'Great day out with the kids', 'It was raining but I still had fun', 'This route is a must see!', 'I had a great time on this cycle', 'really enjoyed myself', 'great route for a first date', 'I enjoyed this cycle!', 'Great app', 'This was a lot of fun', 'Would recommend', 'saving this route for later so I can do it again', 'great way to spend an afternoon!']

@route_ids = CycleRoute.ids.map(&:to_i)

5.times do
  @user = User.new(name: Faker::FunnyName.name, points: rand(0..90), password: "123456", email: Faker::Internet.email, routes_completed: rand(0..10), distance_cycled: rand(0.40))
  @user.save!

  7.times do
    review = Review.new(comment: @rand_review.sample, rating: rand(3..5), cycle_route_id: @route_ids.sample, user_id: @user.id)
    review.save!
  end
end


