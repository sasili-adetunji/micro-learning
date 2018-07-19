require './config/environment'

class ApplicationController < Sinatra::Base
  enable :sessions
  enable :static
  use Rack::Flash
  set :views, Proc.new { File.join(root, "../views/") }
  set :public_folder, 'public'
  set :session_secret, "secret_courses"


  # User will only see homepage IF they are not currently logged in
  get '/' do
    if logged_in?
        redirect to "/topics"
    else
        erb :index
    end
  end

  # get '/' do
  #   "About MicroLearning"
  #   erb :"index"
  # end

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