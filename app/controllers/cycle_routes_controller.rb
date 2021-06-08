class CycleRoutesController < ApplicationController

  def index
    @cycle_routes = CycleRoute.near(params[:address_form][:address], 5)
  end

  def show

  end
end
