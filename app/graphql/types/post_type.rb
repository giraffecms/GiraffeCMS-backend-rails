module Types
	class PostType < Types::BaseObject
	  field :id, ID, null: true
	  field :title, String, null: false
	  field :body, String, null: false
	  field :created_at, Time, null: false
	  field :updated_at, Time, null: true
	end
end