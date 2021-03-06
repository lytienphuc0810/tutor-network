class TutorPostsController < ApplicationController
	before_filter :authenticate_user!,:authorized_user?

	def authorized_user?
		redirect_to(root_path) unless current_user && current_user.tutor?
	end
	
	def new_tutor_post
		#get method
    @tutor_post = TutorPost.new
	end
			 	
	def index_tutor_post
		@tutor_posts=current_user.tutor_posts.paginate(:page => params[:page], :per_page => 12)
	end

	def show_tutor_post
		#get method
		@tutor_post=TutorPost.find_by_id(params[:tutor_post_id])
		if @tutor_post.nil?
			redirect_to "/tutor_posts/index_tutor_post/1"
		end
	end

	def edit_tutor_post
		#get method
	  @tutor_post = TutorPost.find_by_id(params[:tutor_post_id])
	end

	def update_tutor_post
		#post method
    @tutor_post = TutorPost.find_by_id(params[:tutor_post_id])
    if(@tutor_post.update_attributes(params[:tutor_post]))
      redirect_to "/tutor_posts/show_tutor_post/#{@tutor_post.id}"
    else
      render action: "edit_tutor_post"
    end
	end

	def create_tutor_post
		#post method
    @tutor_post = TutorPost.new(params[:tutor_post])
    @tutor_post.user = current_user
    @tutor_post.published = true
    if(@tutor_post.save)
      redirect_to "/tutor_posts/show_tutor_post/#{@tutor_post.id}"
    else
      render action: "new_tutor_post"
    end
	end

	def delete_tutor_post
		#post method
		tutor_post = TutorPost.find(params[:tutor_post_id])
		if !tutor_post.nil?
			user_id = tutor_post.user.id
			tutor_post.destroy
		end

		redirect_to "/tutor_posts/index_tutor_post/1"
	end

	def index_recipe
		@recipes=current_user.other_recipes.find_all { |recipe| recipe.poster_confirmation != false }.paginate(:page => params[:page], :per_page => 12)
	end

	def show_recipe
		#post method
		@recipe=Recipe.find_by_id(params[:recipe_id])
		if @recipe.nil?
			redirect_to "/tutor_posts/index_recipe/1"
		end
	end

	def accept_recipe
		@recipe=Recipe.find_by_id(params[:recipe_id])
		if @recipe.poster_confirmation.nil?
			@recipe.poster_confirmation=true

			customer_recipes=Recipe.find_all_by_tutor_post_id(@recipe.tutor_post_id)
			customer_recipes.each do |customer_recipe|
				customer_recipe.poster_confirmation = false
				customer_recipe.save
			end

			@recipe.tutor_post.published=false
			@recipe.tutor_post.save
		end
		if @recipe.save
			redirect_to "/tutor_posts/index_recipe/1"
		else
			redirect_to "/tutor_posts/show_recipe/#{@recipe.id}"
		end
	end

	def deny_recipe
		@recipe=Recipe.find_by_id(params[:recipe_id])
		if @recipe.poster_confirmation.nil?
			@recipe.poster_confirmation=false
		end
		if @recipe.save
			redirect_to "/tutor_posts/index_recipe/1"
		else
			redirect_to "/tutor_posts/show_recipe/#{@recipe.id}"
		end
	end
end
