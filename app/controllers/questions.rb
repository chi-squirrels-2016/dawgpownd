get '/questions/?' do
	@questions = Question.all.order(created_at: :desc)
  erb :index
end

get '/questions/popular' do
	@questions = Question.all.order(view_count: :desc)
	erb :index
end

get '/questions/votes' do
	@questions = Question.all.sort {|a, b| b.vote_count <=> a.vote_count }
	erb :index
end

get '/questions/answers' do
	@questions = Question.all.sort {|a, b| b.answer_count <=> a.answer_count }
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

