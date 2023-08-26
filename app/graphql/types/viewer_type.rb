module Types
  class ViewerType < Types::Base::Object
    field :feed, resolver: Resolvers::FeedResolver
  end
end
