enable :sessions


#GET ====================================


get '/' do
  # Look in app/views/index.erb
  erb :index
end


get '/create' do
  erb :create
end

get '/login' do
  if session[:login] == true
    erb :secret
  else
    redirect '/'
  end
end

get '/logout' do
  session[:login] = false
  p session
  redirect '/'
end


#POST ===================================

post '/create' do
  User.create(params)
  erb :index
end


post '/login' do
  if User.authenticate(params[:email],params[:password])
    session[:login] = true
    p session
    erb :secret
  else
    redirect '/'
  end
end
