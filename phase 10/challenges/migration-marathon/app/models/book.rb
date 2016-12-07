class Book < ActiveRecord::Base
  has_one :checkout
  has_one :category
end