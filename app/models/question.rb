class Question < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :author, class_name: 'User'
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :answers
  validates :title, :body, presence: true

  def pretty_vote_score
    up_votes = self.votes.where(vote_flag: true).count
    down_votes = self.votes.where(vote_flag: false).count
    (up_votes - down_votes).to_s
  end
end
