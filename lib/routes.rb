require 'bcrypt'

class MicroLearning
  get '/admin/signup' do
    haml :signup
  end

  post "/admin/signup" do
    username = params[:username]
    email = params[:email]
    password = params[:password]
    password_salt = BCrypt::Engine.generate_salt
    password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    @user = User.new(username: username, admin: true, email: email, password: password_hash)
    @user.save
    haml :signup
  end
end
