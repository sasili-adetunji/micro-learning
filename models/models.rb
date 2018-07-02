class User < ActiveRecord::Base
  validates_presence_of :email, message: "Email cannot be blank."
  validates :username, length: {
    minimum: 6,
    maximum: 35,
  }, uniqueness: true
  validates :email, uniqueness: true
end