class Topic < ActiveRecord::Base
  validates :name, :description, presence: true
  has_many :topic_resources
  has_many :resources, through: :topic_resources
  has_many :user_topic
  has_many :user, through: :user_topic
end