require 'spec_helper'

describe UserController do
  context 'Sign up' do
    it ' show to a new user' do
      get '/signup'
      expect(last_response).to be_ok
      expect(last_response.body).to include('Signup Form')
    end
  end

  context 'Register a user' do
    it 'with incomplete credentials' do
      post '/signup', email: 'xample@eg.se',
                      password: 'samplapass#', admin: 'no'
      follow_redirect!
      expect(last_response).to be_ok
      expect(last_response.body).to include('Fill all the fields properly!')
    end

    it 'redirect to topics route on successful register' do
      post '/signup', email: 'xample@eg.se', admin: 'no',
                      password: '123saw#', username: 'testsasil'
      expect(last_response.location).to include('/topics')
    end
  end

  context 'Login' do
    it ' show to a new user' do
      get '/login'
      expect(last_response).to be_ok
      expect(last_response.body).to include('Login Form')
    end
  end

  context 'Login a user' do
    it 'with incomplete credentials' do
      post '/login', email: 'xample@eg.se'
      follow_redirect!
      expect(last_response).to be_ok
      expect(last_response.body).to include('Incorrect login credentials')
    end

    it 'redirect to login route for unregistered users' do
      post '/login', username: 'testsasil', password: 'testpass'
      expect(last_response.location).to include('/login')
    end

    it 'redirect to topics route on successful login' do
      User.create(username: 'testsasil', email: 'testuser@example.com',
                  admin: 'no', password: 'testpass')
      post '/login', username: 'testsasil', password: 'testpass'
      expect(last_response.location).to include('/topics')
    end
  end
end
