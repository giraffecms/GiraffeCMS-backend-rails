class AuthenticateUser
	class << self
		def call(email, password)
			JsonWebToken.encode(user_id: user.id) if user(email, password)
		end

		private

			def user(email, password)
				unless user = User.find_by(email: email).try(:authenticate, password)
					raise
				end
			end
	end
end