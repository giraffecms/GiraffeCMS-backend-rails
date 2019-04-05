module Types
  class QueryType < Types::BaseObject
    field :post, PostType, null: false do
      description "Find a post by ID"
      argument :id, ID, required: true
    end

    field :all_posts, [PostType], null: false do
    	description "Returns all posts"
    end

    def post(id:)
      Post.find(id)
    end

    def all_posts
    	Post.all
    end
  end
end
