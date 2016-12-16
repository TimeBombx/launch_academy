class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params['restaurant_id'])
  end

  def create
    @restaurant = Restaurant.find(params['restaurant_id'])
    @review = Review.create(review_params)

    if @review.valid?
      flash.notice = "Review added successfully"
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end

  end

  private
    def review_params
      params.require(:review).permit(:rating, :body, :restaurant_id)
    end
end
