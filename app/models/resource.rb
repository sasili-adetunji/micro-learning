class Resource < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  has_many :topic_resources
  has_many :topics, through: :topic_resources
end

