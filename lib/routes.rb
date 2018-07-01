class MicroLearning
  get '/signup' do
    haml :signup
  end

  post '/signup' do
        username = params[:username]
        email = params[:email]
        password = params[:password]
    haml :signup
  end
end