get '/questions/:question_id/comments/new' do
  @question = Question.find(params[:question_id]);
  erb :'comments/new'
end

post '/questions/:question_id/comments/new' do
  @question = Question.find(params[:question_id])
  if current_user
    @comment = @question.comments.create(user_id: current_user.id, body: params[:body], commentable_type: "Question")
    if @comment.save
      redirect "/questions/#{@question.id}"
    else
      @errors = @comment.errors.full_messages
      erb :'comments/new'
    end
  else
    @errors = ['You must be logged in to post a comment!!']
    erb :'comments/new'
  end
end

get '/answers/:answer_id/comments/new' do
  @answer = Answer.find(params[:answer_id]);
  erb :'comments/new'
end

post '/answers/:answer_id/comments/new' do
  @answer = Answer.find(params[:answer_id])
  puts current_user
  if current_user
    @comment = @answer.comments.create(user_id: current_user.id, body: params[:body], commentable_type: "Answer")
    if @comment.save
      redirect "/questions/#{@answer.question.id}"
    else
      @errors = @comment.errors.full_messages
      erb :'comments/new'
    end
  else
    @errors = ['You must be logged in to post a comment!!']
    erb :'comments/new'
  end
end
