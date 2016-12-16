class Review < ApplicationRecord
  belongs_to :restaurant

  validates_presence_of :body
  validates :rating, numericality: {only_integer: true}
  validates_inclusion_of :rating, in: 1..5, message: "must be between 1 - 5"
end
