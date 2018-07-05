class UserController < ApplicationController

  get '/signup' do
    if logged_in?
        redirect to "/topics"
    else
        erb :"/users/register"
    end
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

  # User currently logged in will view the Courses page directly
  get '/login' do
    if logged_in?
      redirect to "/topics"
    else
      erb :"/users/login"
    end
  end

  # Verify user information to Log In
  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/topics"
    else
      flash[:error] = "Incorrect login credentials"
      redirect to "/login"
    end
  end

  # Log Out process
  get '/logout' do
    if logged_in?
      session.clear
      flash[:message] = "You have successfully logged out"
      redirect to "/login"
    else
      redirect to "/"
    end
  end
end
