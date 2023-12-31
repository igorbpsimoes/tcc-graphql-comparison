module Types
  module BaseInterface
    include GraphQL::Schema::Interface
    edge_type_class(Types::Base::Edge)
    connection_type_class(Types::Base::Connection)

    field_class Types::Base::Field
  end
end
