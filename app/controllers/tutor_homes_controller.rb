class TutorHomesController < ApplicationController
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
		@recipe=Recipe.find_by_others_id_and_owner_id(params[:customer_id], current_user.id)
		
		if @recipe.nil?
			@recipe=Recipe.new(:poster_confirmation => nil)
			@recipe.others=User.find_by_id(params[:customer_id])
			@recipe.owner=current_user

			@recipe.save
		end

		redirect_to "/tutor_homes/show_recipe/#{@recipe.id}"
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