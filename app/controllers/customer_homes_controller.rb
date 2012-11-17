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
		@recipe=Recipe.create(:poster_confirmation => false)
		@recipe.user=User.find_by_id(params[:customer_id])
		@tutor=User.find_by_id(params[:tutor_id])
		@tutor.recipes.push(@recipe)
		redirect_to "/customer_homes/show_recipe/#{@recipe.id}"
	end

	def show_recipe
		#post method
		@recipe=Recipe.find_by_id(:recipe_id)
	end

	def delete_recipe
		#post method
	end
end