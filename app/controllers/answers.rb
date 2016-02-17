get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  erb:'answers/new'
end

post '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  if current_user
    @answer = @question.answers.create(user_id: current_user.id, body: params[:body])
      if @answer.save
        redirect "/questions/#{@question.id}"
      else
        @errors = @answer.errors.full_messages
        erb :'answers/new'
      end
  else
    @errors = ['You need to be logged in to answer a question!']
    erb :'answers/new'
  end
end