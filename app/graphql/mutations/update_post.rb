module Mutations
	class UpdatePost < Mutations::BaseMutation
		argument :post, ID, required: true
		argument :title, String, required: false
		argument :body, String, required: false

		field :post, Types::PostType, null: true
		field :errors, [String], null: false

		def resolve(post:, title: nil, body: nil) # body and title must be set to nil, because they arent required
			if context[:current_user].try(:admin?)
				update_post(post, title, body)
			else
				{
					post: nil,
					errors: ['You are not allowed to update posts']
				}
			end
		end

		private

			def update_post(post_id, title, body)
				post = Post.find(post_id)
				attributes = {title: title, body: body}
				post.update(attributes.delete_if { |_, v| v.nil? })

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