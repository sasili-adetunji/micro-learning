class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  validates :username, :email, presence: true
end
