module Mutations
	class CreatePost < Mutations::BaseMutation
		argument :title, String, required: true
		argument :body, String, required: true

		field :post, Types::PostType, null: true
		field :errors, [String], null: false

		def resolve(title: nil, body: nil)
			if context[:current_user].try(:admin?)
				create_post(title, body)
			else
				{
					post: nil,
					errors: ['You are not allowed to create posts']
				}
			end
		end

		private

			def create_post(title, body)
				post = Post.new(title: title, body: body)
				if post.save
					context[:current_user].posts << post
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