module RequestSpecHelper
	def json
		JSON.parse(response.body)
	end

	def token_generator(user_id)
		JsonWebToken.encode(user_id: user_id)
	end

	def valid_auth_headers
		{
      'Authorization' => token_generator(user.id),
    }
	end
end