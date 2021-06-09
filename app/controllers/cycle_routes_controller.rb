class CycleRoutesController < ApplicationController
  def index
    @seed_images = {
      'Victoria Park' => "rideriot/vicPark_cerwb5.png",
      'Regents Canal' => "rideriot/regCanal_jj3i9r.png",
      'CS1' => "rideriot/cs1_vvgyjl.png",
      'Tower of London' => "rideriot/tower_u3rjsc.png"
    }
    # THIS IS A TEMPORARY FIX ... need to remember the address if returning
    # to the index from show
    if params[:address_form].nil?
      @cycle_routes = CycleRoute.near("138 Kingsland Rd, London E2 8DY", 5)
    else
      @cycle_routes = CycleRoute.near(params[:address_form][:address], 5)
    end
  end

  def show
    @seed_images = {
      'Victoria Park' => "rideriot/vicPark_cerwb5.png",
      'Regents Canal' => "rideriot/regCanal_jj3i9r.png",
      'CS1' => "rideriot/cs1_vvgyjl.png",
      'Tower of London' => "rideriot/tower_u3rjsc.png"
    }
    @cycle_route = CycleRoute.find(params[:id])
  end
end
