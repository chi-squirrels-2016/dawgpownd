get '/sessions/login/?' do
  erb :'sessions/login'
end

get '/sessions/register/?' do
  erb :'sessions/register'
end

get '/sessions/logout/?' do
  session[:user_id] = nil
  erb :'sessions/logout'
end

post '/sessions/login/?' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect "/questions"
  else
    @errors = ["Invalid login. Try again"]
    erb :'sessions/login'
  end
end

post '/sessions/register/?' do
  user = User.new(first_name: params[:first_name],
                  last_name: params[:last_name],
                  email: params[:email]
                  )
  user.password = params[:password]
  if user.save
    session[:user_id] = user.id
    redirect "/questions"
  else
    @errors = user.errors.full_messages
    erb :'sessions/register'
  end
end