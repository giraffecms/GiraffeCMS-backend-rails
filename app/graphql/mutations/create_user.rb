module Mutations
	class CreateUser < Mutations::BaseMutation
		argument :username, String, required: true
		argument :email, String, required: true
		argument :password, String, required: true

		field :user, Types::UserType, null: true
		field :token, String, null: true
		field :errors, [String], null: false

		def resolve(username: nil, email: nil, password: nil)
			user = User.new(username: username, email: email, password: password)
			if user.save
				{
					user: user,
					token: JsonWebToken.encode(user_id: user.id),
					errors: [],
				}
			else
				{
					user: nil,
					token: nil,
					errors: user.errors.full_messages,
				}
			end
		end
	end
end