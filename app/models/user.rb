class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :contributor_id
  has_many :votes, foreign_key: :voter_id
  has_many :comments, foreign_key: :commenter_id

 validates :username, uniqueness: true, presence: true
 validates :email, uniqueness: true, presence: true
  
  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.validate(args)
    username = args.fetch("username")
    password = args.fetch("password")
    user = User.find_by(username: username)
    if user && user.password == password
      user
    end
  end
end
