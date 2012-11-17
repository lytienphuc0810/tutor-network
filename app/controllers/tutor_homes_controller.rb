class TutorHomesController < ApplicationController
	def index_customer_post
		#get method
		@customer_posts= CustomerPost.paginate(:page => params[:page])
	end

	def show_customer_post
		#get method
		@customer_post = CustomerPost.find(params[:customer_post_id])
	end

	def create_recipe
		#post method
	end

	def delete_recipe
		#post method
	end
end