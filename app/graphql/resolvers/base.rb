module Resolvers
  class Base < GraphQL::Schema::Resolver
    # if you have a custom argument class, you can attach it:
    argument_class Types::Base::Argument

    def current_user
      context[:current_user]
    end
  end
end
