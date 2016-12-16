class RestaurantsController < ApplicationController
  layout "application"

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params['id'])
  end

  def index
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.create(rest_params)
    if @restaurant.valid?
      flash.notice = "Restaurant added successfully"
      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  private
    def rest_params
      params.require(:restaurant).permit(:name, :address, :city, :state, :zip, :description)
    end
end
