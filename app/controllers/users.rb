get "/users/:id/?" do

  if @user = User.find_by_id(params[:id])
    activity_types = ["activities","questions","answers","comments", "votes"]
    @activities = activity_types.map do |activity_type|
      @user.send(activity_type).sort{|a,b| b.created_at <=> a.created_at}
    end
    @show_size = 5
    erb :'users/show'
  else
    erb :'404'
  end

end

get "/users/:id/activities/:size/?" do

  if @user = User.find_by_id(params[:id])
    if request.xhr?
      if request["activityType"] == "All Activity"
        @activities = @user.activities.sort{|a,b| b.created_at <=> a.created_at }
      else
        # downcase and add trailing s
        activity_name = request["activityType"].downcase
        @activities = @user.send(activity_name).order(created_at: :desc)
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
