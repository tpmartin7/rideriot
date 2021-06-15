class ReviewsController < ApplicationController

  def new
    @cycle_route = CycleRoute.find(params[:cycle_route_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @cycle_route = CycleRoute.find(params[:cycle_route_id])
    @review.cycle_route = @cycle_route
    @review.user_id = current_user.id
    if @review.save
      redirect_to cycle_route_path(params[:cycle_route_id], anchor: "review-#{@review.id}")
    else
      flash[:alert] = "something went wrong"
      render :new
    end
  end

  # def destroy

  # end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
