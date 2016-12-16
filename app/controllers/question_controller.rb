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

post '/questions' do
  @question = Question.new(params[:question])
  @question.author = current_user

  if @question.save && logged_in?
    if request.xhr?
      @question
      erb :'/questions/_question_post', layout: false
    else
      redirect '/'
    end
  else
    if request.xhr?
      @errors = @question.errors.full_messages
      status 420
      erb :'errors/_errors', layout: false
    else
      redirect '/errors/404'
    end
  end

  #   if @question.save
  #     if request.xhr?
  #       @question
  #       erb :'/questions/_question_post', layout: false
  #     else
  #       redirect '/'
  #     end
  #     redirect '/'
  #   else
  #     @questions = Question.order(created_at: :desc)
  #     @errors = @question.errors.full_messages
  #     erb :'questions/index', layout: false
  #   end
  # else
  #   redirect '/'
  # end
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

