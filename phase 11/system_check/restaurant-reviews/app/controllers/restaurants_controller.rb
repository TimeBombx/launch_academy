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
    Restaurant.create(rest_params)
    redirect_to restaurants_path
  end

  private
    def rest_params
      params.require(:restaurant).permit(:name, :address, :city, :state, :zip, :description)
    end
end
