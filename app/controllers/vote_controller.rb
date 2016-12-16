post '/questions/:id/votes' do
  question = Question.find_by(id: params[:id])

  if request.xhr?
    # Question must be found and vote must exist with the current voter ID
    # This will update the vote when clicked as opposed to creating a new vote
    if question && vote = question.votes.find_by(voter_id: current_user.id)

      vote.update(
        vote_flag: params[:vote_flag]
      )

      pos_count = question.votes.where(vote_flag: true).count
      neg_count = question.votes.where(vote_flag: false).count

      # Net vote score of a given post and the object id to find it on the page
      question.pretty_vote_score
    elsif question
      question.votes.create(
        vote_flag: params[:vote_flag],
        voter_id: current_user.id
      )
    else
      status 422
      "Unable to vote for the post. It may have been deleted since you've visted us."
    end
  else
    status 404
  end
end

# Redo the logic here for the answers/comments things
# post '/answers/:id/votes' do
#   question = Answer.find_by(id: params[:id])

#   if request.xhr?
#     # Question must be found and vote must exist with the current voter ID
#     # This will update the vote when clicked as opposed to creating a new vote
#     if question && vote = question.votes.find_by(voter_id: current_user.id)

#       vote.update(
#         vote_flag: params[:vote_flag]
#       )

#       pos_count = question.votes.where(vote_flag: true).count
#       neg_count = question.votes.where(vote_flag: false).count

#       # Net vote score of a given post and the object id to find it on the page
#       question.pretty_vote_score
#     elsif question
#       question.votes.create(
#         vote_flag: params[:vote_flag],
#         voter_id: current_user.id
#       )
#     else
#       status 422
#       "Unable to vote for the post. It may have been deleted since you've visted us."
#     end
#   else
#     status 404
#   end
# end
