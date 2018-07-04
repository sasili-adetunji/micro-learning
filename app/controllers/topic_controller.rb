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


end
