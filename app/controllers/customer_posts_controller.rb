class CustomerPostsController < ApplicationController
	before_filter :authenticate_user!,:authorized_user?

	def authorized_user?
		redirect_to(root_path) unless current_user && current_user.customer?
	end
	
	def new_customer_post
		#get method
    @customer_post = CustomerPost.new
    @customer_post.user = current_user
    @customer_post.district = @customer_post.user.district
    @customer_post.city_province = @customer_post.user.city_province
	end
			 	
	def index_customer_post
		@customer_posts=current_user.customer_posts.paginate(:page => params[:page], :per_page => 12)
	end

	def show_customer_post
		#get method
		@customer_post=CustomerPost.find_by_id(params[:customer_post_id])
		if @customer_post.nil?
			redirect_to "/customer_posts/index_customer_post/1"
		end
	end

	def edit_customer_post
		#get method
	  @customer_post = CustomerPost.find_by_id(params[:customer_post_id])
	end

	def update_customer_post
		#post method
    @customer_post = CustomerPost.find_by_id(params[:customer_post_id])
    if(@customer_post.update_attributes(params[:customer_post]))
      redirect_to "/customer_posts/show_customer_post/#{@customer_post.id}"
    else
      render action: "edit_customer_post"
    end
	end

	def create_customer_post
		#post method
    @customer_post = CustomerPost.new(params[:customer_post])
    @customer_post.user = current_user
    @customer_post.published = true
    if(@customer_post.save)
      redirect_to "/customer_posts/show_customer_post/#{@customer_post.id}"
    else
      render action: "new_customer_post"
    end
	end

	def delete_customer_post
		#post method
		customer_post = CustomerPost.find(params[:customer_post_id])
		if !customer_post.nil?
			user_id = customer_post.user.id
			customer_post.destroy
		end

		redirect_to "/customer_posts/index_customer_post/1"
	end

	def index_recipe
		@recipes=current_user.other_recipes.find_all { |recipe| recipe.poster_confirmation != false }.paginate(:page => params[:page], :per_page => 12)
	end

	def show_recipe
		#post method
		@recipe=Recipe.find_by_id(params[:recipe_id])
		if @recipe.nil?
			redirect_to "/customer_posts/index_recipe/1"
		end
	end

	def accept_recipe
		@recipe=Recipe.find_by_id(params[:recipe_id])
		if @recipe.poster_confirmation.nil?
			@recipe.poster_confirmation=true

			tutor_recipes=Recipe.find_all_by_customer_post_id(@recipe.customer_post_id)
			tutor_recipes.each do |tutor_recipe|
				tutor_recipe.poster_confirmation = false
				tutor_recipe.save
			end

			@recipe.customer_post.published=false
			@recipe.customer_post.save
		end
		if @recipe.save
			redirect_to "/customer_posts/index_recipe/1"
		else
			redirect_to "/customer_posts/show_recipe/#{@recipe.id}"
		end
	end

	def deny_recipe
		@recipe=Recipe.find_by_id(params[:recipe_id])
		if @recipe.poster_confirmation.nil?
			@recipe.poster_confirmation=false
		end
		if @recipe.save
			redirect_to "/customer_posts/index_recipe/1"
		else
			redirect_to "/customer_posts/show_recipe/#{@recipe.id}"
		end
	end
end
