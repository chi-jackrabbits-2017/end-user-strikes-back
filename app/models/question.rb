class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :author, class_name: 'User'
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :answers

  def pretty_vote_count
    self.votes.length.to_s + ' votes'
  end
end
