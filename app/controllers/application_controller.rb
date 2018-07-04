require 'sinatra'
require 'sinatra/activerecord'

class ApplicationController < Sinatra::Base
  enable :sessions
  use Rack::Flash
  set :views, Proc.new { File.join(root, "../views/") }
  set :session_secret, "secret_courses"


  # User will only see homepage IF they are not currently logged in
  get '/' do
    if logged_in?
        redirect to "/topics"
    else
        erb :index
    end
  end

  helpers do

    # Check if a user is logged into their account
    def logged_in?
      !!current_user
    end
    
    # Find current user
    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end
end