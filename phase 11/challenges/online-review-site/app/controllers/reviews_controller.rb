class ReviewsController < ApplicationController
  layout "layout"

  def index
    @reviews = Review.all
  end

  def show
  end
end
