module Resolvers
  class BaseFeedResolver < Base
    type [Types::TweetType], null: false

    def resolve
      raise NotImplementedError
    end
  end

  class FeedResolver < BaseFeedResolver
    def resolve
      FeedBuilder.for(current_user)
    end
  end

  class FeedResolverPreload < BaseFeedResolver
    def resolve
      FeedBuilder.for(current_user).includes(:author)
    end
  end
end
