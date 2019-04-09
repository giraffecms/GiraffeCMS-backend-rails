class AuthorizeRequest
	class << self
		def call(headers)
			if auth_header
				payload = JsonWebToken.decode(auth_header)
				user_id = payload[:user_id]

				User.find(user_id)
			end
		end

		def auth_header(headers)
			if headers['Authorization'].present?
      	headers['Authorization'].split(' ').last
      end
    end
end