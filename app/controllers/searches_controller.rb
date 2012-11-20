class SearchesController < ApplicationController
	def customer

	end

	def customer_post
		@tutor_posts = TutorPost.mysearch(params).paginate(:page => params[:page], :per_page => 3)
		render 'customer_homes/index_tutor_post.haml' 
	end

	def customer_tutor

	end

	def customer_tutor_post
		@users = User.mysearch(params, "tutor").paginate(:page => params[:page], :per_page => 12) 
		render 'users/index.haml' 
	end

	def tutor

	end

	def tutor_post
		@customer_posts = CustomerPost.mysearch(params).paginate(:page => params[:page], :per_page => 3)
		render 'tutor_homes/index_customer_post.haml' 
	end

	def tutor_customer

	end

	def tutor_customer_post
		@users = User.mysearch(params, "customer").paginate(:page => params[:page], :per_page => 12) 
		render 'users/index.haml' 
	end
end