class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.create(manufacturer_params)

    if @manufacturer.save
      flash.notice = "Successfully created the manufacturer"
      redirect_to manufacturers_path
    else
      render 'new'
    end
  end

  def show
    @manufacturer = Manufacturer.find(params['id'])
  end

  private
    def manufacturer_params
      params.require(:manufacturer).permit!
    end
end
