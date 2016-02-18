get '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  if request.xhr?
      erb :_answer_form, layout: false, locals: { question: @question}
  else
    erb:'answers/new'
  end
end

post '/questions/:question_id/answers/new' do
  @question = Question.find(params[:question_id])
  if current_user
    @answer = @question.answers.create(user_id: current_user.id, body: params[:body])
      if @answer.save
        if request.xhr?
          erb :_new_answer, layout: false, locals: {answer: @answer}
        else
          redirect "/questions/#{@question.id}"
        end
      else
        @errors = @answer.errors.full_messages
        if request.xhr?
          erb :'sessions/_errors', layout: false
        else
          erb :'answers/new'
        end
      end
  else
    @errors = ['You need to be logged in to answer a question!']
    if request.xhr?
      erb :'sessions/_errors', layout: false
    else
      erb :'answers/new'
    end
  end
end
