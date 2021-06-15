class AttemptsController < ApplicationController


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

    @locations = Location.where(cycle_route: @cycle_route.id)

    @markers = []

    @markers << start_point = {
      lat: Geocoder.search(@cycle_route.start_point).first.coordinates.first,
      lng: Geocoder.search(@cycle_route.start_point).first.coordinates.second,
      info_window: render_to_string(partial: "info_window", locals: { cycle_route: CycleRoute.new(name: "Start Point", description: "Jump on your bike here and have fun!") })
    }

    @locations.each do |location|
      @markers << way_points = {
        lat: Geocoder.search(location.address).first.coordinates.first,
        lng: Geocoder.search(location.address).first.coordinates.second,
        info_window: render_to_string(partial: "info_window", locals: { cycle_route: location })
      }
    end

    @markers << end_point = {
      lat: Geocoder.search(@cycle_route.end_point).first.coordinates.first,
      lng: Geocoder.search(@cycle_route.end_point).first.coordinates.second,
      info_window: render_to_string(partial: "info_window", locals: { cycle_route: CycleRoute.new(name: "End Point", description: "Congrats, you finished this route. Go grab a beer to celebrate!") })
    }

  end

  private
  def attempt_show
    @disable_nav = true
  end
end
