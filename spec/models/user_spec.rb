RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'should not have a invalid email address' do
      it 'is blank email', focus: true do
        user = User.new(email: '', password: 'testpass', username: 'test123')
        user.should_not be_valid
      end
    end

    context 'should not have a invalid username' do
      it 'is blank username', focus: true do
        user = User.new(email: 'e@example.com', password: 'testpass',
                        username: '', password_confirmation: 'testpass')
        user.should_not be_valid
      end
    end

    context 'valid user' do
      it 'when valid data is supplied', focus: true do
        user = User.new(email: 'e.example.com', password: 'testpass',
                        username: 'testadm')
        user.should be_valid
      end
    end
  end
end
