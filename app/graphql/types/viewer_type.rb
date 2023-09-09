module Types
  class ViewerType < Types::Base::Object
    field :feed, resolver: Resolvers::FeedResolver
    field :feed_with_preload, resolver: Resolvers::FeedResolverPreload
  end
end
