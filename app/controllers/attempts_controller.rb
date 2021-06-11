class AttemptsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :create, :show ]

  def create
    @attempt = Attempt.new
    @attempt.user = current_user
    @attempt.cycle_route = CycleRoute.find(params[:cycle_route_id])
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

  private
  def attempt_show
    @disable_nav = true
  end

end
