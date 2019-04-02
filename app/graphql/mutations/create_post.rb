module Mutations
	class CreatePost < Mutations::BaseMutation
		argument :title, String, required: true
		argument :body, String, required: true

		field :post, Types::PostType, null: true
		field :errors, [String], null: false

		def resolve(title: nil, body: nil)
			post = Post.new(title: title, body: body)
			if post.save
				{
					post: post,
					errors: [],
				}
			else
				{
					post: nil,
					errors: post.errors.full_messages,
				}
			end
		end
	end
end