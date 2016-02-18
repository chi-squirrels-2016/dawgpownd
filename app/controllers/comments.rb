get '/questions/:question_id/comments/new' do
  @question = Question.find(params[:question_id]);
  if request.xhr?
    erb :'_comment_form', layout: false
  else
    erb :'comments/new'
  end
end

post '/questions/:question_id/comments/new' do
  @question = Question.find(params[:question_id])
  if current_user
    @comment = @question.comments.create(user_id: current_user.id, body: params[:body], commentable_type: "Question")
    if @comment.save
      if request.xhr?
        erb :'_comment', layout: false, locals: { comment: @comment }
      else
        redirect "/questions/#{@question.id}"
      end
    else
      @errors = @comment.errors.full_messages
      if request.xhr?
        erb :'sessions/_errors', layout: false
      else
        erb :'comments/new'
      end
    end
  else
    @errors = ['You must be logged in to post a comment!!']
    if request.xhr?
      erb :'sessions/_errors', layout: false
    else
      erb :'comments/new'
    end
  end
end

get '/answers/:answer_id/comments/new' do
  @answer = Answer.find(params[:answer_id]);
  if request.xhr?
    erb :'_comment_form', layout: false
  else
    erb :'comments/new'
  end
end

post '/answers/:answer_id/comments/new' do
  @answer = Answer.find(params[:answer_id])
  if current_user
    @comment = @answer.comments.create(user_id: current_user.id, body: params[:body], commentable_type: "Answer")
    if @comment.save
      if request.xhr?
        erb :'_comment', layout: false, locals: { comment: @comment }
      else
        redirect "/questions/#{@answer.question.id}"
      end
    else
      @errors = @comment.errors.full_messages
      if request.xhr?
        erb :'sessions/_errors', layout: false
      else
        erb :'comments/new'
      end
    end
  else
    @errors = ['You must be logged in to post a comment!!']
    if request.xhr?
      erb :'sessions/_errors', layout: false
    else
      erb :'comments/new'
    end
  end
end
