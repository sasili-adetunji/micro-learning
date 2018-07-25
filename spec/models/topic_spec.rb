RSpec.describe Topic, type: :model do
  context 'valid topic' do
    it 'when valid data is supplied', focus: true do
      topic = Topic.new(name: 'topic name', description: 'topic description')
      topic.should be_valid
    end
  end
  context 'topic without topic name' do
    it 'when valid data is supplied', focus: true do
      topic = Topic.new(name: '', description: 'topic description')
      topic.should_not be_valid
    end
  end
  context 'topic without topic description' do
    it 'when valid data is supplied', focus: true do
      topic = Topic.new(name: 'topic name', description: '')
      topic.should_not be_valid
    end
  end
end
