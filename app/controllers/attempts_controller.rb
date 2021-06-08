class AttemptsController < ApplicationController
  def show
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
end
