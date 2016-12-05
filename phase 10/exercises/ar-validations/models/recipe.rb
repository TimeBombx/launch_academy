class Recipe < ActiveRecord::Base
  has_many :comments
  validates :name, presence: true, uniqueness: true
  validates :name,  format: { with: /brussels sprouts/i }
  validates :serving, uniqueness: false
  validates :serving, numericality: { greater_than_or_equal_to: 1 }, :allow_blank => true
end