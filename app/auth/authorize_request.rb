class AuthorizeRequest
	def self.call(headers)
		return false unless headers['Authorization'].present?

		auth_header = headers['Authorization'].split(' ').last
		payload = JsonWebToken.decode(auth_header)
		user_id = payload["user_id"]

		User.find(user_id)
	end
end