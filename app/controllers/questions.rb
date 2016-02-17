get '/questions/?' do
  erb :index
end

get '/questions/new' do
	erb :'questions/new'
end

post '/questions/new' do
	if current_user
		@question = current_user.questions.create(params[:question]);
		if @question.save
			redirect "/questions/#{@question.id}"
		else
			@errors = @question.errors.full_messages
			erb :'/questions/new'
		end
	else
		@errors = ["You must be logged in to create an entry!!"]
		erb :'/questions/new'
	end
end

