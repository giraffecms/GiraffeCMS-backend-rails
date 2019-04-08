class JsonWebToken
	SECRET = Rails.application.credentials.secret_key_base
	ALGORITHM = 'HS256'

	class << self
		def encode(payload, exp = 15.minutes.from_now)
			puts SECRET
			payload[:exp] = exp.to_i

			JWT.encode(payload, SECRET, ALGORITHM)
		end

		def decode(token)
			body = JWT.decode(token, SECRET, true, { algorithm: ALGORITHM})
		end
	end
end