class CycleRoutesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @seed_images = seed_images
    @cycle_routes = CycleRoute.near(params[:address_form][:address], 5)
  end

  def show
    @seed_images = seed_images
    @cycle_route = CycleRoute.find(params[:id])
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
