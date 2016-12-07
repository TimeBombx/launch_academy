class Category < ActiveRecord::Base
  belongs_to :book
  has_many :books

  validates_presence_of :name
end