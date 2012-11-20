class EtcsController < ApplicationController
	before_filter :authenticate_user!
	def faq 
		
	end

	def contact
		
	end

	def set_en
		if current_user.nil?
			session[:lang] = "en"
		else	
			current_user.locale = "en"
			current_user.save
		end
		redirect_to "/"
	end

	def set_vi
		if current_user.nil?
			session[:lang] = "vi"
		else	
			current_user.locale = "vi"
			current_user.save
		end
		redirect_to "/"
	end
end