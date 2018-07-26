# Resource Controller for the application
class ResourceController < ApplicationController
  # View all topics
  get '/resources' do
    if logged_in?
      @resources = Resource.all
      erb :"/resources/index"
    else
      flash[:error] = 'You are not currently logged in!'
      redirect to :"/login"
    end
  end

  # admin can view form to create a new topic
  get '/resources/new' do
    if logged_in?
      if current_user.admin
        erb :"/resources/new"
      else
        flash[:error] = 'You are not an admin!'
        redirect to '/resources'
      end
    else
      redirect to :"/login"
    end
  end

  # admin CREATE a new resource
  post '/resources' do
    if logged_in? && current_user.admin
      @new_resource = Resource.create(title: params[:title],
                                      description: params[:description],
                                      url: params[:url])
      if @new_resource.save
        flash[:message] = 'Resource created Successfully'
        redirect to '/resources'
      else
        flash[:error] = 'Please ensure you have filled in all required fields correctly!'
        redirect to '/resources/new'
      end
    else
      redirect to :"/login"
    end
  end

  # admin can view form to create add resource to topic
  post '/resources/:id' do
    if logged_in? && current_user.admin
      @topic = Topic.find_by(id: params[:id])
      existing_resources = @topic.resources.find_by(id: params[:resource_ids])
      @resources = Resource.find(params[:resource_ids])
      if existing_resources
        flash[:error] = 'The resource already existed'
      else
        @topic.resources << @resources
      end
      redirect to "/resources/#{@topic.id}"
    else
      redirect to :"/login"
    end
  end

  # admin and users can view resources of a particular topic
  get '/resources/:id' do
    if logged_in?
      @topic = Topic.find_by(id: params[:id])
      @resources = @topic.resources
      @all_resources = Resource.all
      erb :"/resources/show"
    else
      redirect to '/login'
    end
  end
end
