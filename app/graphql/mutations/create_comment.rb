module Mutations
	class CreateComment < Mutations::BaseMutation
		argument :post, ID, required: true
		argument :title, String, required: true
		argument :body, String, required: true

		field :comment, Types::CommentType, null: true
		field :errors, [String], null: false

		def resolve(post:, title:, body:)
			if context[:current_user]
				create_comment(post, title, body)
			else
				{
					comment: nil,
					errors: ['You must be logged in to create comment']
				}
			end
		end

		private

			def create_comment(post_id, title, body)
				post = Post.find(post_id)
				comment = post.comments.new(user_id: context[:current_user].id, title: title, body: body)
				if comment.save
					{
						comment: comment,
						errors: [],
					}
				else
					{
						comment: nil,
						errors: comment.errors.full_messages,
					}
				end
			end
	end
end