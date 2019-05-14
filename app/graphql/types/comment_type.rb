module Types
	class CommentType < Types::BaseObject
		description "Comment to a blog post"
	  field :id, ID, null: false
	  field :post, PostType, null: false
	  field :author, UserType, null: false
	  field :title, String, null: false
	  field :body, String, null: false
	  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
	  field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
	end
end