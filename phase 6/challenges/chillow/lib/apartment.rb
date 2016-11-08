require 'Dwelling'
class Apartment < Dwelling
  attr_reader :rent, :lease_start_date, :lease_end_date

  def initialize(address, city_or_town, zip_code, rent, lease_start_date, lease_end_date)
    super(address, city_or_town, nil, zip_code)
    @rent
    @lease_start_date = lease_start_date
    @lease_end_date = lease_end_date
    @max_roommates = 4
    @roommates = Array.new
  end

  def full?
    @roommates.size >= @max_roommates
  end

  def add_roommate(occupant)
    @roommates << occupant
  end

  def remove_roommate(occupant)
    @roommates.delete(occupant)
  end
end