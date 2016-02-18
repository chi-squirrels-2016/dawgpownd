get "/users/:id/?" do
  # my activity (listing my questions, my answers, my comments)
  # recent activity on my questions
  # recent activity on my answers
  if @user = User.find_by_id(params[:id])
    @questions = @user.questions
    @answers = @user.answers
    @comments = @user.comments
    @votes = @user.votes
    @activities = @user.activities
    @activities_array = [@questions, @answers, @comments, @votes]
    erb :'users/show'
  else
    erb :'404'
  end
end
