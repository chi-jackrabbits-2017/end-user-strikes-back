get '/user/:id' do
  @user = User.find_by(:id => params[:id])
  @user_questions = Question.where(:author_id => @user.id)
  @question_answers = Answer.where(:question_id => @user_questions.ids)
  erb :profile
end
