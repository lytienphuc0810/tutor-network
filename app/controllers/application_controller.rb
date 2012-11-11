class ApplicationController < ActionController::Base
  protect_from_forgery
	def after_sign_in_path_for(user)
		case user.role
			when "admin"
				"/"
			when "tutor"
				"/tutor_homes/index_customer_post"
		end
	end
end
