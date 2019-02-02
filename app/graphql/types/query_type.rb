module Types
  class QueryType < Types::BaseObject
    field :all_posts, [PostType], null: true

    def posts
      Post.all
    end
  end
end
