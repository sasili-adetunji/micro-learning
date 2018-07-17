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

    #  users can view a single topic page
    get '/topics/:id' do
        @topic = Topic.find_by_id(params[:id])
        @resources = Resource.all
        @topic = Topic.find_by(id: params[:id])
        @res = @topic.resources
        if logged_in?
            erb :"/topics/show"
        else
            flash[:error] = "You are not currently logged in!"
            redirect to "/login"
        end
    end

    get '/topics/:id/edit' do
        @topic = Topic.find_by_id(params[:id])
        if logged_in?
            if current_user.admin
                erb :"/topics/edit"
            else
                flash[:error] = "You are not an admin!"
                redirect to :"/login"
            end
        end
    end

    # admin can UPDATE topic
    patch '/topics/:id' do
        @topic = Topic.find_by_id(params[:id])
        @topic.update(name: params[:name], description: params[:description])

        if current_user.admin
            if @topic.save
                flash[:message] = "Successfully edited topic."
                redirect to "/topics/#{@topic.id}"
            else 
                flash[:message] = "Something went wrong. Please try to edit topic again."
                redirect to "/topics/#{@topic.id}/edit"
            end
        else
            redirect to "/topics/#{@topic.id}"
        end
    end

    # admin can delete a topic
    delete '/topics/:id' do
        @topic = Topic.find_by_id(params[:id])
        if current_user.admin
            if @topic.destroy
                flash[:message] = "Successfully deleted topic."
                redirect to "/topics"
            else 
                flash[:message] = "Something went wrong. Please try to delete topic again."
                redirect to "/topics/#{@topic.id}/edit"
            end
        else
            redirect to "/topics/#{@topic.id}"
        end
    end

    post '/topics/:id/subscribe' do
        @topic = Topic.find_by_id(params[:id])
        if !current_user.admin
            @topic_subscribe = UserTopic.create(user_id: session[:user_id], topic_id: params[:id])
            if @topic_subscribe.save
                flash[:message] = "User topics updated!"
                redirect to "/subscribed"
            else
                redirect to "/topics/#{@topic.id}"
            end
        else
            redirect to :"/login"
        end
    end
  # user can view courses subscribed
    get '/subscribed' do
        if logged_in?
            if !current_user.admin                
                @subscribed = current_user.topic
                # return "Nice one #{current_user.topic}"
                erb :"/topics/my_topic"
            else
                redirect to :"/topics"
            end
        else
            redirect to :"/login"
        end
    end

    # user can delete his topic
    delete '/subscribed/topics/:id' do
        @user_topic = UserTopic.where(topic_id: params[:id])
        if current_user.id == @user_topic[0].user_id
            @user_topic.destroy_all
            flash[:message] = "Successfully deleted topic."
            redirect to "/subscribed"
        else
            redirect to "/topics/"
        end
    end
end
