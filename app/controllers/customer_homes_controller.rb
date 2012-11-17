class CustomerHomesController < ApplicationController
	def index_tutor_post
		#get method
		@tutor_posts=TutorPost.paginate(:page => params[:page])
	end

	def show_tutor_post
		#get method
		@tutor_post=TutorPost.find_by_id(params[:tutor_post_id])
	end

	def create_recipe
		#post method
		@recipe=Recipe.find_by_tutor_id_and_customer_id(params[:tutor_id], current_user.id)
		
		if @recipe.nil?
			@recipe=Recipe.new(:poster_confirmation => false)
			@recipe.customer=User.find_by_id(current_user.id)
			@tutor=User.find_by_id(params[:tutor_id])
			@tutor.tutor_recipes.push(@recipe)

			@recipe.save
			@tutor.save
		end

		redirect_to "/customer_homes/show_recipe/#{@recipe.id}"
	end

	def index_recipe
		@recipes=Recipe.paginate(:page => params[:page]).find_all_by_customer_id(current_user.id)
	end

	def show_recipe
		#post method
		@recipe=Recipe.find_by_id(params[:recipe_id])
	end

	def delete_recipe
		#post method
		recipe=Recipe.find_by_id(params[:recipe_id])
		recipe.delete
		redirect_to "/customer_homes/index_tutor_post/1"
	end
end