get '/questions/?' do
	@questions = Question.all
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

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers.sort{ |a,b| a.votes.length <=> b.votes.length }
  @accepted_answer = @question.accepted_answer
  erb :'questions/show'
end

