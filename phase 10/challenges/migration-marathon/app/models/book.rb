class Book < ActiveRecord::Base
  has_many :checkouts

  validates :title, presence: true, uniqueness: true
end