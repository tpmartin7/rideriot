class ReviewsController < ApplicationController

  def new
    @cycle_route = CycleRoute.find(params[:cycle_route_id])
    @review = Review.new
  end

  def create
    @params = params[:review]
    @review = Review.new(comment: @params[:comment], rating: @params[:rating], cycle_route_id: params[:cycle_route_id])
    @review.user_id = current_user.id
    @review.save!
    redirect_to cycle_route_path(params[:cycle_route_id], anchor: "review-#{@review.id}")
  end

  # def destroy

  # end

  private

  def review_params

  end
end
