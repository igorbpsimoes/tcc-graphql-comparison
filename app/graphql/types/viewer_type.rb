module Types
  class ViewerType < Types::Base::Object
    field :feed, resolver: Resolvers::FeedResolverPreload
  end
end
