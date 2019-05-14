class ApplicationController < ActionController::API
	private
		def current_user
			AuthorizeRequest.call(request.headers)
		end
end
