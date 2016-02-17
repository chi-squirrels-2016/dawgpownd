get '/login/?' do
  erb :'sessions/login'
end

get '/register/?' do
  erb :'sessions/register'
end

get '/logout/?' do
  session[:user_id] = nil
  erb :'sessions/logout'
end

post '/login/?' do
  user = User.authenticate(params[:username], params[:password])
  if user
    session[:user_id] = user.id
    redirect "/questions"
  else
    @errors = ["Invalid login. Try again"]
    erb :'sessions/login'
  end
end

post '/register/?' do
  user = User.new(params)
  user.password = params[:password]
  if user.save
    session[:user_id] = user.id
    redirect "/questions"
  else
    @errors = user.errors.full_messages
    erb :'sessions/register'
  end
end
