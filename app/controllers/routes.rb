# require 'bcrypt'

# class MicroLearning
#   get '/admin/signup' do
#     haml :signup
#   end

#   get '/admin/home' do
#     @category = Category.all()
#     haml :admin
#   end

#   get '/admin/fail' do
#     return "Oh no something happended"
#   end
#   post '/admin/home' do
#     category = params[:category]
#     @new_category = Category.new(category: category)
#     @new_category.save
#     if @new_category.save
#       redirect to "/admin/home"
#     else
#       redirect to "/admin/fail"
#     end    
#   end

#   post "/admin/signup" do
#     username = params[:username]
#     email = params[:email]
#     password = params[:password]
#     password_salt = BCrypt::Engine.generate_salt
#     password_hash = BCrypt::Engine.hash_secret(password, password_salt)
#     @user = User.new(username: username, admin: true, email: email, password: password_hash)
#     @user.save
#     if @user.save
#       session[:user_id] = @user.id
#       redirect to "/admin/home"
#     else
#       redirect to "/admin/signup"
#     end
#   end
# end
