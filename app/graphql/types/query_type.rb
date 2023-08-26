module Types
  class QueryType < Types::Base::Object
    field :viewer, Types::ViewerType, null: true, resolver_method: :current_user
  end
end
