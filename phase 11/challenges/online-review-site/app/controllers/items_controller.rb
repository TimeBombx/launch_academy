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
    @item = Item.create(item_params)
    redirect_to item_path(@item)
  end

  def delete
  end

  def update
  end

  private
    def item_params
      params.require(:item).permit(:name, :description)
    end
end
