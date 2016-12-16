get '/user/:id' do
  @user = User.find_by(:id => params[:id])
  @user_questions = Question.where(:author_id => @user.id)
  erb :profile
end
