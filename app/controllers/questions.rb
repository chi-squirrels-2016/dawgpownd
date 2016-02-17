get '/questions/?' do

end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers_by_vote
  @a = @answers.find(2)
  erb :'questions/show'
end

