require 'bcrypt'

class User < ActiveRecord::Base
  # has_secure_password

  has_many :comments

  validates :email, presence: :true, uniqueness: :true
  validates :password_digest, presence: :true

  include BCrypt

  def password
    @password ||= Password.new(self.password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end
end
