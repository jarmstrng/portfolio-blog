class User < ActiveRecord::Base
  has_many :comments

  validates :username, presence: :true
  validates :email, presence: :true, uniqueness: :true
  validates :password_digest, presence: :true
end
