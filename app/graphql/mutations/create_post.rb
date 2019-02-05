module Mutations
	class CreatePost < Mutations::BaseMutation
		argument :title, String, required: true
		argument :body, String, required: true

		type Types::PostType

		def resolve(title: nil, body: nil)
			post = Post.create!(title: title, body: body)
			{
				id: post.id,
				title: post.title,
				body: post.body,
				created_at: post.created_at,
				updated_at: post.updated_at,
			}
		end
	end
end