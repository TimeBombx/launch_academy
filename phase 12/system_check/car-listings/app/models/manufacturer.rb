class Manufacturer < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :country

  has_many :cars
end
