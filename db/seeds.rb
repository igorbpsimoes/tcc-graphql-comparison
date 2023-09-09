# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

current_user = FactoryBot.create(:user, nickname: 'igorbpsimoes')

followed_users = FactoryBot.create_list(:user, 100)

followed_users.each do |followed_user|
  FactoryBot.create(:user_connection, user: followed_user, follower: current_user)
end

10.times do
  followed_users.each do |followed_user|
    tweet = FactoryBot.create(:tweet, author: followed_user)

    FactoryBot.create(:comment, tweet: tweet, user: current_user)
  end
end
