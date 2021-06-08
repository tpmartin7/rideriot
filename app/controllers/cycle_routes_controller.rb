class CycleRoutesController < ApplicationController
  @SEED_IMAGES = ["rideriot/vicPark_cerwb5.png", "rideriot/regCanal_jj3i9r.png", "rideriot/cs1_vvgyjl.png", "rideriot/tower_u3rjsc.png"]

  def index
    @cycle_routes = CycleRoute.near(params[:address_form][:address], 5)
  end

  def show
    @cycle_route = CycleRoute.find(params[:id])
  end
end
