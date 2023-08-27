class User < ApplicationRecord
  has_many :tweets, class_name: 'Tweet', foreign_key: :author_id
  has_many :votes
  has_many :comments

  has_many :followers_connections, class_name: 'UserConnection', foreign_key: :user_id
  has_many :followers, through: :followers_connections, source: :follower, class_name: 'User'

  has_many :followed_connections, class_name: 'UserConnection', foreign_key: :follower_id
  has_many :followed_users, through: :followed_connections, source: :user, class_name: 'User'

end
