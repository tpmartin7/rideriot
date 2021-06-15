class AttemptsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :create, :show ]

  def create
    @attempt = Attempt.new
    @attempt.user = current_user
    @attempt.cycle_route = CycleRoute.find(params[:cycle_route_id])
    @attempt.start_time = DateTime.current
    @attempt.save
    redirect_to attempt_path(@attempt)
  end

  def show
    attempt_show
    @attempt = Attempt.find(params[:id])
    @cycle_route = @attempt.cycle_route

    points =[]
    points << Geocoder.search(@cycle_route.start_point).first.coordinates
    points << Geocoder.search(@cycle_route.end_point).first.coordinates

    @markers = points.map do |coordinates|
      {
        lat: coordinates.first,
        lng: coordinates.second
      }
    end
  end

  def finish
    current_user.routes_completed += 1
    @attempt = Attempt.find(params[:id])
    current_user.distance_cycled += @attempt.cycle_route.total_distance
    @attempt.end_time = DateTime.current
    @attempt.save
    current_user.set_badges
    current_user.points = (current_user.distance_cycled / current_user.routes_completed).to_i
    current_user.save
    redirect_to attempt_path(params[:id], complete: true)
  end

  private

  def attempt_show
    @disable_nav = true
  end
end
