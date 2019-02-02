module Types
  class QueryType < Types::BaseObject
    field :posts, [PostType], null: true

    def posts
      Post.all
    end
  end
end
