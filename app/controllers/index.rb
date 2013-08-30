### get requests ####
enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/logout' do
  session[:login] = nil
  redirect '/'
end

get '/newuser' do
  erb :newuser
end

get '/profile' do
  if session[:login]
    @user = session[:login]
    erb :profile
  else
    redirect '/'
  end
end

### post requests ###

post '/login' do
  user_info = params[:form]
  if User.authenticate(user_info[:email],user_info[:password]) 
    @user = User.authenticate(user_info[:email],user_info[:password])
    session[:login] = @user
    p session[:login]
    erb :login 
  else
  redirect '/'
  end
end

post '/new_user_process' do

  p params[:form]
  newuser = User.create(params[:form])
  erb :new_user_process
end