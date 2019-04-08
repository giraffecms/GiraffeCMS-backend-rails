module GraphQL
	module MutationsHelper
		def create_post_mutation
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

		def create_user_mutation
			%(
				mutation CreateUser(
					$username: String!,
					$email: String!,
					$password: String!,
				) {
					createPost(input: {
						username:$username,
						email:$email,
						password:$password,
					}) {
						user {
							id
							username
							email
						}
						errors
					}
				}
			)
		end
	end
end