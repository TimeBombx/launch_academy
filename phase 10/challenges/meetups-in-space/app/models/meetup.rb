class Meetup < ActiveRecord::Base
  has_many :users, through: :user_meetups
  has_many :user_meetups
  has_many :comments

  belongs_to :user
end