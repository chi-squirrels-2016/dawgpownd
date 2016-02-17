get '/questions/?' do
  erb :index
end

get '/questions/new' do
	erb :'questions/new'
end