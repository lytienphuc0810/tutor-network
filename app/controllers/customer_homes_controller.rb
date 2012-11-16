class CustomerHomesController < ApplicationController
	def index_tutor_post
		#get method
		@tutor_posts=TutorPost.paginate(:page => params[:page])
	end

	def show_tutor_post
		#get method
		@tutor_post=TutorPost.find(params[:tutor_post_id])
	end

	def create_recipe
		#post method
	end

	def delete_recipe
		#post method
	end
end