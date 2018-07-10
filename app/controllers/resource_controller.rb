class ResourceController < ApplicationController

  # View all topics
  get '/resources' do
    if logged_in?
      @resources = Resource.all
      erb :"/resources/index"
    else
      flash[:error] = "You are not currently logged in!"
      redirect to :"/login"
    end
  end
 
    # admin can view form to create a new topic
  get '/resources/new' do
    if logged_in?
      if current_user.admin 
        erb :"/resources/new"
      else
        flash[:error] = "You are not an admin!"
        redirect to "/resources"
      end
    else
        redirect to :"/login"
    end
  end

    # admin CREATE a new resource
  post '/resources' do
      @new_resource = Resource.create(title: params[:title], description: params[:description], url: params[:url])
      if @new_resource.save 
        flash[:message] = "Resource created Successfully"
        redirect to "/resources"
      else
        flash[:error] = "Please ensure you have filled in all required fields correctly!"
        redirect to "/resources/new"
      end
    end
end




# class ResourceController < ApplicationController

#   post '/resource/:id' do
#     if logged_in?
#         if current_user.admin
#             @new_resource = Resource.create(title: params[:title], description: params[:description], url: params[:url])
#             if @new_resource.save
                # @resource_topic = ResourceTopic.create(topic_id: params[:id], resource_id: @new_resource.id)
#                 @resource_topic.save    
#                 erb :"/resources/index"
#             end
#         else
#             flash[:error] = "You are not an admin!"
#             redirect to "/resources"
#         end
#     else
#         redirect to :"/login"
#     end
#   end
 
#   # admin can view form to create add resource
#   get '/resource/:id' do
#     if logged_in?
#         @subscribed = UserTopic.where(user_id: current_user.id)
#         if current_user.admin 
#             erb :"/resources/index"
#         else
#             flash[:error] = "You are not an admin!"
#             redirect to "/resources"
#         end
#     else
#         redirect to :"/login"
#     end
#   end
# end