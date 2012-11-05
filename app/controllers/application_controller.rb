class ApplicationController < ActionController::Base
  protect_from_forgery
	def after_sign_in_path_for(user)
		case user.role
			when "admin"
				"/users/index/1"
			when "user"
				"/tutor_posts/index/1"
		end
	end
end
