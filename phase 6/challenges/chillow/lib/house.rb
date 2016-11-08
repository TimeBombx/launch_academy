class House < Dwelling
  attr_reader :asking_price

  def initialize(address, city_or_town, zip_code, asking_price)
    super(address, city_or_town, nil, zip_code)
    @asking_price = asking_price
  end
end