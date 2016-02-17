get '/questions/?' do
  erb :index
end

get '/questions/new' do
	erb :'questions/new'
end

post '/questions/new' do
	if current_usertions.create(params[:question]);
		if @question.save
    @question = current_user.ques
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

