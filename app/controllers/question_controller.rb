get '/questions' do
  @questions = Question.order(created_at: :desc)
  erb :'questions/index'
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])

  if @question
    erb :'questions/show'
  else
    @questions = Question.order(created_at: :desc)
    @errors = ['sorry, cannot find that question']
    erb :'/questions/index'
  end
end

delete '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  if @question
    if logged_in? && current_user == @question.author
      @question.destroy
      redirect '/'
    else
      redirect '/'
    end
  else
    redirect '/'
  end
end
