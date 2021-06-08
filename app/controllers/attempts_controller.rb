class AttemptsController < ApplicationController
  def show
    @attempt = Attempt.find(params[:id])
    @cycle_route = @attempt.cycle_route

    @markers = [
      {
        lat: @cycle_route.latitude,
        lng: @cycle_route.longitude
      }
    ]
  end
end
