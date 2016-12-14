class ItemsController < ApplicationController
  layout "layout"

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params['id'])
    @reviews = @item.reviews.order("created_at DESC")
    @review = Review.new
  end

  def new
    @item = Item.new
  end

  def create
  end

  def delete
  end

  def update
  end
end
