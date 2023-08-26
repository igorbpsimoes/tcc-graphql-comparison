module Resolvers
  class FeedResolverPreload < Base
    type [Types::TweetType], null: false

    def resolve
      FeedBuilder.for(current_user)
    end
  end
end
