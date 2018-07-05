require 'bcrypt'

class TopicController < ApplicationController

  # View all topics
  get '/topics' do
    if logged_in?
      @topics = Topic.all
      erb :"/topics/index"
    else
      flash[:error] = "You are not currently logged in!"
      redirect to :"/login"
    end
  end


    # admin can view form to create a new topic
    get '/topics/new' do
        if logged_in?
            if current_user.admin 
                erb :"/topics/new"
            else
                flash[:error] = "You are not an admin!"
                redirect to "/topics"
            end
        else
            redirect to :"/login"
        end
    end

    # admin CREATE a new topic
    post '/topics' do
        @new_course = Topic.create(name: params[:name], description: params[:description])

        if @new_course.save 
            flash[:message] = "Topic created Successfully"
            redirect to "/topics"
        else
            flash[:error] = "Please ensure you have filled in all required fields correctly!"
            redirect to "/topics/new"
        end
    end

end
