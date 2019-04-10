class ApplicationController < ActionController::Base
	private
		def current_user
			AuthorizeRequest.call(request.headers)
		end
end
