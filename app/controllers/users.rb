get "/users/:id/?" do

  if @user = User.find_by_id(params[:id])
    @activities = @user.activities.sort{ |a,b| b.created_at <=> a.created_at }
    @activities_array = [@user.questions.order(created_at: :asc), @user.answers.order(created_at: :asc), @user.comments.order(created_at: :asc), @user.votes.order(created_at: :asc)]
    @show_size = 5
    erb :'users/show'
  else
    erb :'404'
  end

end

get "/users/:id/activities/:size/?" do

  if @user = User.find_by_id(params[:id])
    if request.xhr?
      case request["activityType"]
      when "All"
        @activities = @user.activities.sort{|a,b| b.created_at <=> a.created_at }
      when "Question"
        @activities = @user.questions.order(created_at: :asc)
      when "Answer"
        @activities = @user.answers.order(created_at: :asc)
      when "Comment"
        @activities = @user.comments.order(created_at: :asc)
      when "Vote"
        @activities = @user.votes.order(created_at: :asc)
      end
      erb :'users/_activities', layout: false, locals: { user_id: @user.id, show_size: @activities.length, activities: @activities }
    else
      @activities = @user.activities.sort{ |a,b| b.created_at <=> a.created_at }
      @activities_array = [@user.questions, @user.answers, @user.comments, @user.votes]
      @show_size = params[:size].to_i
      erb :'users/show'
    end
  else
    erb :'404'
  end

end
