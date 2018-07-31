# User model
class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  validates :username, :email, presence: true
  has_many :user_topic
  has_many :topic, through: :user_topic
end
