get '/questions/?' do
  erb :index
end

get '/questions/new' do
	erb :'questions/new'
end

post '/questions' do
	session[:user_id] = 2
	@question = current_user.questions.create(params[:question]);
	p @question
	if @question.save
		redirect "/questions/#{@question.id}"
	else
		redirect '/questions/new'
	end
end