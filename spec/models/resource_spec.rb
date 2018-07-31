RSpec.describe Resource, type: :model do
  context 'valid resource' do
    it 'when valid data is supplied', focus: true do
      resource = Resource.new(title: 'Resource titile',
                              description: 'resource description')
      resource.should be_valid
    end
  end

  context 'resource without title' do
    it 'when valid data is supplied', focus: true do
      resource = Resource.new(title: '', description: 'Resource description')
      resource.should_not be_valid
    end
  end

  context 'resource without description' do
    it 'when valid data is supplied', focus: true do
      resource = Resource.new(title: 'Resource ttile', description: '')
      resource.should_not be_valid
    end
  end
end
