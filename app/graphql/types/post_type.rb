module Types
	class PostType < Types::BaseObject
		description "Blog post"
	  field :id, ID, null: false
	  field :title, String, null: false
	  field :body, String, null: false
	  field :authors, [UserType], null: false
	  field :comments, [CommentType], null: true
	  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
	  field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
	end
end