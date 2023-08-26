module Types
  class TweetType < Types::Base::Object
    field :content, String
    field :author, Types::UserType, null: false
  end
end
