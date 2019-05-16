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
							authors {
								id
								username
							}
						}
						errors
					}
				}
			)
		end

		def update_post_mutation
			%(
				mutation UpdatePost(
					$post: ID!,
					$title: String,
					$body: String,
				) {
					updatePost(input: {
				    post:$post,
				    title:$title,
				    body:$body,
				  }) {
						post {
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
					createUser(input: {
						username:$username,
						email:$email,
						password:$password,
					}) {
						user {
							id
							username
							email
						}
						token,
						errors,
					}
				}
			)
		end

		def login_mutation
			%(
				mutation Login(
					$email: String!,
					$password: String!,
				) {
					login(input: {
						email:$email,
						password:$password,
					}) {
						token,
						errors,
					}
				}
			)
		end

		def create_comment_mutation
			%(
				mutation CreateComment(
					$post: ID!,
					$title: String!,
					$body: String!,
				) {
					createComment(input: {
						post:$post,
						title:$title,
						body:$body,
					}) {
						comment {
							id,
							title,
							body,
							author {
								username
							},
							post {
								id,
							}
						},
						errors,
					}
				}
			)
		end
	end
end