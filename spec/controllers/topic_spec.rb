require 'spec_helper'

describe TopicController do
  User.create(username: 'testsasil', email: 'testuser@example.com', admin: 'yes',
              password: 'testpass')
  context 'Topic form' do
    it 'add new the topic' do
      post '/login', username: 'testsasil', password: 'testpass'

      get '/topics'

      # post '/topics', name: '', description:  'The gentle introduction
      #                 to learning javascript'
      # expect(last_response).to be_ok
      puts last_response.body
      # expect(last_response.body).to include('trash')
    end
  end
end
