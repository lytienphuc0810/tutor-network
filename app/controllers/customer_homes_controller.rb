class CustomerHomesController < ApplicationController
	before_filter :authenticate_user!,:authorized_user?

	def authorized_user?
		redirect_to(root_path) unless current_user && current_user.customer?
	end

	def index_tutor_post
		#get method
		@tutor_posts=TutorPost.paginate(:page => params[:page])
	end

	def show_tutor_post
		#get method
		@tutor_post=TutorPost.find_by_id(params[:tutor_post_id])
		if @tutor_post.nil?
			redirect_to "/customer_homes/index_tutor_post/1"
		end
	end

	def create_recipe
		#post method
		@recipe=Recipe.find_by_tutor_post_id_and_owner_id(params[:tutor_post_id], current_user.id)
		
		if @recipe.nil?
			@recipe=Recipe.new(:poster_confirmation => nil)
			@recipe.other=User.find_by_id(params[:tutor_id])
			@recipe.owner=current_user
			@recipe.tutor_post=TutorPost.find_by_id(params[:tutor_post_id])
			@recipe.save
		end

		redirect_to "/customer_homes/index_tutor_post/1"
	end

	def index_recipe
		@recipes=current_user.owner_recipes.paginate(:page => params[:page], :per_page => 12)
	end

	def show_recipe
		#post method
		@recipe=Recipe.find_by_id(params[:recipe_id])
		if @recipe.nil?
			redirect_to "/customer_homes/index_recipe/1"
		end
	end

	def delete_recipe
		#post method
		recipe=Recipe.find_by_id(params[:recipe_id])

		if (!recipe.nil?)
			recipe.destroy
		end

		redirect_to "/customer_homes/index_tutor_post/1"
	end

	def rate
    @user = User.find(params[:tutor_id])
    @user.rate(params[:stars], current_user, params[:dimension])
    render :update do |page|
      page.replace_html @user.wrapper_dom_id(params), ratings_for(@user, params.merge(:wrap => false))
      page.visual_effect :highlight, @user.wrapper_dom_id(params)
    end
  end
end