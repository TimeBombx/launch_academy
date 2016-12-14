class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates_presence_of :title
  validates_presence_of :rating
end