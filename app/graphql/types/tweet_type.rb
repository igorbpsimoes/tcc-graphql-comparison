module Types
  class TweetType < Types::Base::Object
    field :content, String
    field :author, Types::UserType, null: false, method: :user
    field :author_graphql_batch, Types::UserType, null: false
    field :author_batch_loader, Types::UserType, null: false

    def author_graphql_batch
      Loaders::RecordLoader.for(User).load(object.author_id)
    end

    def author_batch_loader
      BatchLoader::GraphQL.for(object.author_id).batch do |author_ids, loader|
        User.where(id: author_ids).each { |author| loader.call(author.id, author) }
      end
    end
  end
end
