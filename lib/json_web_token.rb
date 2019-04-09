class JsonWebToken
	SECRET = Rails.application.credentials.jwt
	ALGORITHM = 'HS256'

	class << self
		def encode(payload, exp = 15.minutes.from_now)
			payload[:exp] = exp.to_i

			JWT.encode(payload, SECRET, ALGORITHM)
		end

		def decode(token)
			body = JWT.decode(token, SECRET, true, { algorithm: ALGORITHM})[0]
		end
	end
end