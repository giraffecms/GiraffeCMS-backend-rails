class AuthenticateUser
	class << self
		def call(email, password)
			user = User.find_by(email: email).try(:authenticate, password)
			JsonWebToken.encode(user_id: user.id) if user
		end
	end
end