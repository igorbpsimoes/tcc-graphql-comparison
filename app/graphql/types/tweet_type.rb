module Types
  class TweetType < Types::Base::Object
    field :content, String
    field :author, UserType, null: false, method: :user
    field :author_graphql_batch, UserType, null: false
    field :author_batch_loader, UserType, null: false

    def author_graphql_batch
      Loaders::RecordLoader.for(User).load(object.user_id)
    end

    def author_batch_loader
      BatchLoader::GraphQL.for(object.user_id).batch do |user_ids, loader|
        User.where(id: user_ids).each { |author| loader.call(author.id, author) }
      end
    end
  end
end
