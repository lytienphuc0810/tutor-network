class TutorHomesController < ApplicationController
	before_filter :authenticate_user!,:authorized_user?

	def authorized_user?
		redirect_to(root_path) unless current_user && current_user.tutor?
	end
	
	def index_customer_post
		#get method
		@customer_posts=CustomerPost.paginate(:page => params[:page])
	end

	def show_customer_post
		#get method
		@customer_post=CustomerPost.find_by_id(params[:customer_post_id])
		if @customer_post.nil?
			redirect_to "/tutor_homes/index_customer_post/1"
		end
	end

	def create_recipe
		#post method
		@recipe=Recipe.find_by_customer_post_id_and_owner_id(params[:customer_post_id], current_user.id)
		
		if @recipe.nil?
			@recipe=Recipe.new(:poster_confirmation => nil)
			@recipe.other=User.find_by_id(params[:customer_id])
			@recipe.owner=current_user
			@recipe.customer_post=CustomerPost.find_by_id(params[:customer_post_id])
			@recipe.save
		end

		redirect_to "/tutor_homes/index_customer_post/1"
	end

	def index_recipe
		@recipes=current_user.owner_recipes.paginate(:page => params[:page], :per_page => 12)
	end

	def show_recipe
		#post method
		@recipe=Recipe.find_by_id(params[:recipe_id])
		if @recipe.nil?
			redirect_to "/tutor_homes/index_recipe/1"
		end
	end

	def delete_recipe
		#post method
		recipe=Recipe.find_by_id(params[:recipe_id])

		if (!recipe.nil?)
			recipe.destroy
		end

		redirect_to "/tutor_homes/index_customer_post/1"
	end
end