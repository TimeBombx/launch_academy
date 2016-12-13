class ReviewsController < ApplicationController
  layout "layout"

  def index
    @reviews. Review.limited(1)
    # @reviews = Review.all.order('created_at DESC')
  end

  def show
    @review = Review.find(params['id'])
  end

  def new
    if !@user.present?
      flash[:error] = "Please sign in to post a review"
      redirect_to reviews_path
    end

    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    @review.user_id = session['id']

    if @review.save
      redirect_to review_path(@review)
    else
      render 'new'
    end
  end

  private
    def review_params
      params.require(:review).permit(:title, :body, :rating)
    end
end
