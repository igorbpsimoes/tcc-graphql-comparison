module FeedBuilder
  module_function

  def for(user)
    Tweet.where(author: user.followed_users)
         .order(created_at: :desc)
         .limit(10)
  end
end
