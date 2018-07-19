require 'spec_helper'

describe UserController do

  describe "Login" do
    it 'loads the login page' do
      get '/login'
      expect(last_response.status).to eq(200)
    end

    it 'does not let a logged in user view the login page' do
      user = User.create(:username => "testname",:email => "testuser@example.com", :password => "testpass")
      params = {
        :username => "testname",
        :password => "testpass"
      }
      post '/login', params
      session = {}
      session[:user_id] = user.id
      get '/login'
      expect(last_response.location).to include("/topics")
    end
  end

  describe "Logout" do
    it "let a logged in user logout" do
      user = User.create(:username => "testname",:email => "testuser@example.com", :password => "testpass")
      params = {
        :username => "testname",
        :password => "testpass"
      }
      post '/login', params
      get '/logout'
      expect(last_response.location).to include("/login")
    end

    it 'does not let a user logout if not logged in' do
      get '/logout'
      expect(last_response.location).to include("/")
    end
  end

  describe 'Signup action' do
    it 'loads the user signup page' do
      get '/signup'
      expect(last_response.status).to eq(200)
    end

   it 'does not let a user sign up without a email' do
    params = {
      :username => "test",
      :email => "",
      :password => "test"
    }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

  it 'does not let a user sign up without a password' do
    params = {
      :username => "testuser",
      :email => "testuser@example.com",
      :password => ""
    }

      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

  it 'does not let a user sign up without a username' do
    params = {
      :username => "",
      :email => "testuser@example.com",
      :password => "testpass"
    }
      post '/signup', params
      expect(last_response.location).to include('/signup')
    end

  it 'signup directs user to topic index page' do
    params = {
      :username => "tester",
      :email => "anothertest@example.com",
      :password => "anotherpass"
    }
      post '/signup', params
      expect(last_response.location).to include("/topics")
    end

  it 'does not let a logged in user view the signup page' do
    user = User.create(:username => "realtest",:email => "realtest@example.com", :password => "realpass")
    params = {
      :username => "realtest",
      :password => "realpass"
    }
      post '/login', params
      session = {}
      session[:user_id] = user.id
      
      get '/signup'
      expect(last_response.location).to include("/topics")
    end
  end
end