class AuthorizeRequest
	def self.call(headers)
		if !headers.nil? && headers['Authorization'].present?
			auth_header = headers['Authorization'].split(' ').last
			payload = JsonWebToken.decode(auth_header)
			user_id = payload[:user_id]

			User.find(user_id)
		end
	end
end