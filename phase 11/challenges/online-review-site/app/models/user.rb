class User < ApplicationRecord
  include BCrypt

  has_many :reviews

  validates :username, :presence => true, :uniqueness => { :case_sensitive => false }

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
