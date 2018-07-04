require 'bcrypt'

class UserController < ApplicationController

  get '/signup' do
    if logged_in?
        redirect to "/topics"
    else
        erb :"/users/register"
    end
  end

  get '/topics' do
    return "Nice on here are the topics"
  end
    # CREATE a new user based on form information
  post '/signup' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user.admin = params[:admin] == "yes" ? true : false
    if @user.save
        session[:user_id] = @user.id
        redirect to "/topics"
    else
        flash[:error] = "Fill all the fields properly!"
        redirect to "/signup"
    end
  end
end
