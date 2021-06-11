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
      'Victoria Park' => "rideriot/vicPark_cerwb5.png",
      'Regents Canal' => "rideriot/regCanal_jj3i9r.png",
      'CS1' => "rideriot/cs1_vvgyjl.png",
      'Tower of London' => "rideriot/tower_u3rjsc.png"
    }
  end
end
