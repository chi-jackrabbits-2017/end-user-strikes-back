class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :contributor_id
  has_many :votes, foreign_key: :voter_id
  has_many :comments, foreign_key: :commenter_id

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def validate(args)
    p args
  end
end
