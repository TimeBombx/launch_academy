class Restaurant < ApplicationRecord
  has_many :reviews

  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip
  validates :zip, numericality: {only_integer: true}
  validates_length_of :zip, is: 5

  def full_location
    "#{address} #{city}, #{state}, #{zip}"
  end
end
