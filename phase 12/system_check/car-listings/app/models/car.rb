class Car < ApplicationRecord
  validates_presence_of :year
  validates_presence_of :color
  validates_presence_of :model
  validates_presence_of :mileage
  validates_presence_of :manufacturer_id

  validates_numericality_of :year, greater_than: 1920

  belongs_to :manufacturer

  def info
    "#{year} #{manufacturer.name} #{model}, #{color}, with #{mileage} miles"
  end
end
