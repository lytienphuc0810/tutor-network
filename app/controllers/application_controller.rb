class ApplicationController < ActionController::Base
  protect_from_forgery
	def after_sign_in_path_for(user)
		case user.role
			when "admin"
				"/"
			when "tutor"
				"/tutor_homes/index_customer_post/1"
			when "customer"
				"/customer_homes/index_tutor_post/1"
		end
	end
end
