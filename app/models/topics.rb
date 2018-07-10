class Topic < ActiveRecord::Base
  validates :name, :description, presence: true
  has_many :topic_resources
  has_many :resources, through: :topic_resources
end