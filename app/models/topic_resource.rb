# topic Resource model
class TopicResource < ActiveRecord::Base
  belongs_to :topic
  belongs_to :resource
end
