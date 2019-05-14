module Mutations::User
	class Login < Mutations::BaseMutation
		argument :email, String, required: true
		argument :password, String, required: true

		field :token, String, null: true
		field :errors, [String], null: false

		def resolve(email: nil, password: nil)
			if token = AuthenticateUser.call(email, password)
				{
					token: token,
					errors: []
				}
			else
				{
					token: nil,
					errors: ["Wrong password or email"]
				}
			end
		end
	end
end