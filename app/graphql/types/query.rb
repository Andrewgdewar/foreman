module Types
  class Query < GraphQL::Schema::Object
    graphql_name 'Query'

    field :node, field: GraphQL::Relay::Node.field
    field :nodes, field: GraphQL::Relay::Node.plural_field

    field :model, Types::Model,
      function: Queries::FetchField.new(type: Types::Model, model_class: ::Model), null: true

    field :models, Types::Model.connection_type, connection: true,
      function: Queries::PluralField.new(type: Types::Model, model_class: ::Model)
  end
end
