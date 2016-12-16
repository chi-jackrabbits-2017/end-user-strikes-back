post '/questions/:id/votes' do
  question = Question.find_by(params[:id])

  if request.xhr?
    if question
      question.votes.create(
        vote_flag: params[:vote_flag],
        voter_id: current_user.id
      )
      pos_count = question.votes.where(vote_flag: true).count
      neg_count = question.votes.where(vote_flag: false).count

      # Net vote score of a given post and the object id to find it on the page
      (pos_count - neg_count).to_s
    else
      status 422
      "Unable to vote for the post. It may have been deleted since you've visted us."
    end
  else
    status 404
  end
end
