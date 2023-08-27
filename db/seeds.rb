# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

john = User.create!(
  nickname: "john.doe"
)

other_users = User.create!(
  [
    { nickname: "gabriela.h" },
    { nickname: "andre.v" },
    { nickname: "tiago.c" },
    { nickname: "pedro.b" },
    { nickname: "duda.m" },
    { nickname: "camila.c" },
  ]
)

other_tweets = other_users.map do |user|
  tweet = Tweet.create!(
    content: "tweet de #{user.nickname}",
    author: user
  )

  UserConnection.create!(
    user: user,
    follower: john
  )

  comment = Comment.create!(
    content: "random comment #{rand(1..100)}",
    user: john,
    tweet:
  )

  Vote.create!(
    [
      {
        user: john,
        voteable: tweet
      },
      {
        user: user,
        voteable: comment
      }
    ]
  )
end
