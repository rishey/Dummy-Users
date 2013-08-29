### get requests ####
enable :sessions

get '/' do
  # Look in app/views/index.erb
  	p params

  erb :index
end

get '/newuser' do
		p params

  erb :newuser
end

### post requests ###

post '/login' do
  user_info = params[:form]
  # the following works - returns user object if valid else nil
  if User.authenticate(user_info[:email],user_info[:password]) 
  	@user = User.authenticate(user_info[:email],user_info[:password])
  	session[:user_id] = @user.id
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