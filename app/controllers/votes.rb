get '/questions/:question_id/vote_up' do
  @vote = Vote.new(voteable_type: 'Question', voteable_id: params[:question_id], value: 1, user_id: current_user.id)
  if @vote.save
    if request.xhr?
      Question.find(params[:question_id]).points.to_s
    end
  end
end

get '/questions/:question_id/vote_down' do
  @vote = Vote.new(voteable_type: 'Question', voteable_id: params[:question_id], value: -1, user_id: current_user.id)
  if @vote.save
    if request.xhr?
      Question.find(params[:question_id]).points.to_s
    end
  end
end

get '/answers/:answer_id/vote_up' do
  @vote = Vote.new(voteable_type: 'Answer', voteable_id: params[:answer_id], value: 1, user_id: current_user.id)
  if @vote.save
    if request.xhr?
      Answer.find(params[:answer_id]).points.to_s
    end
  end
end

get '/answers/:answer_id/vote_down' do
  @vote = Vote.new(voteable_type: 'Answer', voteable_id: params[:answer_id], value: -1, user_id: current_user.id)
  if @vote.save
    if request.xhr?
      Answer.find(params[:answer_id]).points.to_s
    end
  end
end
