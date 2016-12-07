class Category < ActiveRecord::Base
  belongs_to :book
  has_many :books
  
  validates :name, presence: true
  validates :name, uniqueness: true
end