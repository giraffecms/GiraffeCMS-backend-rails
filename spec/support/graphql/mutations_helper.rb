module GraphQL
	module MutationsHelper
		def create_post_mutation(input = {})
			%(
				mutation CreatePost(
					$title: String!,
					$body: String!,
				) {
					createPost(input: {
						title:$title,
						body:$body,
					}) {
						post {
							id
							title
							body
						}
						errors
					}
				}
			)
		end
	end
end