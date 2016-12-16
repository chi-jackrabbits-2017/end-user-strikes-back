require 'faker'

5.times do
  User.create(
    username: Faker::StarWars.planet,
    email: Faker::Internet.email,
    password: 'password'
  )
end

User.all.each do |user|
  5.times do
    question = user.questions.create(
      title: Faker::Pokemon.name,
      body: Faker::Pokemon.location
    )

    comment = question.comments.create(
      body: Faker::ChuckNorris.fact,
      commenter_id: rand(1..5)
    )

    answer = question.answers.create(
      body: Faker::StarWars.quote,
      contributor_id: rand(1..5)
    )

    1.upto(5) do |num|
      question.votes.create(
        voter_id: num,
        vote_flag: [true, false].sample
      )

      answer.votes.create(
        voter_id: num,
        vote_flag: [true, false].sample
      )

      comment.votes.create(
        voter_id: num,
        vote_flag: [true, false].sample
      )
    end
  end
end
