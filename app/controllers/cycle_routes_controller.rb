class CycleRoutesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @seed_images = seed_images

    # Filter routes that match tags
    # Which tags are selected in params?
    selected_tag_names = []
    params[:address_form].keys[1..].each do |tag_name|
      selected_tag_names << tag_name if params[:address_form][tag_name] == "1"
    end

    # Perform address search first
    @cycle_routes = CycleRoute.near(params[:address_form][:address], 5)
    # Returns ActuveRecord relation

    # No tags selected? No filter
    return if selected_tag_names.empty?

    # Convert to array for select! to work
    @cycle_routes = @cycle_routes.to_a

    # For each route, make a list of tags. Only select routes that contain all
    # tags passed in params.
    @cycle_routes.select! do |cycle_route|
      route_tag_names = []
      cycle_route.tags.each do |route_tag|
        route_tag_names << route_tag.name
      end
      (selected_tag_names - route_tag_names).empty?
    end

  end

  def show
    @seed_images = seed_images
    @cycle_route = CycleRoute.find(params[:id])
    @reviews = Review.where(cycle_route: @cycle_route.id)

    if @reviews.present?
      @summed_ratings = @reviews.sum(&:rating)
      @route_rating = @summed_ratings.to_f / @reviews.length
      @rating = @route_rating.round
      @blank_stars = 5 - @rating
    end
  end

  def seed_images
    {
      'Cruise through Victoria Park' => "rideriot/victoria-park-scene_j4jbvl.jpg",
      'Regents Canal Towpath' => "rideriot/regents-canal-scene_g32jxn.jpg",
      "London's First Cycle Highway" => "rideriot/cs1-scene_x2waif.jpg",
      'See the Tower of London' => "rideriot/tole-scene_ssysqj.jpg",
      "Battersea Park" => "rideriot/battersea-park-scene_frnhro.jpg",
      'Limehouse Basin' => "rideriot/limehouse-basin-scene_nzlpi2.jpg",
      'Big Ben' => "rideriot/big-ben-scene_n2dww2.jpg",
      'Finsbury Park' => "rideriot/finsbury-park-scene_miuqwn.jpg",
      'Regents Park Circular' => "rideriot/Regents-Park_osihzj.jpg",
      'Tower of London West' => "rideriot/tower-of-london-west-scene_pmey7z.jpg",
      'Hyde Park Loop' => "rideriot/hyde-park-loop-scene_zdj7ts.jpg"
    }
  end
end
