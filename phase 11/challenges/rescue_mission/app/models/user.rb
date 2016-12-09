class User < ApplicationRecord
  has_many :questions

  def name
    "#{first_name} #{last_name}"
  end
end
