class ReviewsController < ApplicationController
  layout "layout"

  def new
    if !@user.present?
      flash[:error] = "Please sign in to post a review"
      redirect_to items_path
    end

    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    @review.user_id = session['id']

    if @review.save
      redirect_to item_path(id: review_params[:item_id])
    end
  end

  def destroy
    review = Review.find(params['id'])
    item = review.item
    review.delete
    redirect_to item_path(item)
  end

  private
    def review_params
      params.require(:review).permit(:title, :body, :rating, :item_id)
    end
end
