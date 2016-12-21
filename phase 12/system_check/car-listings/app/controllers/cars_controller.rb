class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
    common
  end

  def create
    @car = Car.create(car_params)

    if @car.save
      flash.notice = "Successfully created a new car"
      redirect_to cars_path
    else
      common
      render 'new'
    end
  end

  private
    def car_params
      params.require(:car).permit!
    end

    def common
      @manufacturers = Manufacturer.all
      @manufacturer = Manufacturer.find_by(name: params['manufacturer']) || Manufacturer.first
    end
end
