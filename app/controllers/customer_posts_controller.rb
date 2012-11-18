class CustomerPostsController < ApplicationController
	def new_customer_post
		#get method
    @customer_post = CustomerPost.new
	end
			 	
	def index_customer_post
		@customer_posts=CustomerPost.paginate(:page => params[:page]).find_all_by_user_id(current_user.id)
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
	  @customer_post = CustomerPost.find_by_id(params[:customer_post])
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
    if(@customer_post.save)
      redirect_to "/customer_posts/show_customer_post/#{@customer_post.id}"
    else
      render action: "new_customer_post"
    end
	end

	def delete_customer_post
		#post method
		customer_post = CustomerPost.find(params[:customer_post_id])
		if customer_post.nil?
			# send error message
		else
			user_id = customer_post.user.id
			customer_post.destroy
			redirect_to "/user_posts/index/#{user_id}/1"
		end
	end

	def index_recipe
		@recipes=Recipe.paginate(:page => params[:page]).find_all_by_tutor_id()
	end

	def show_recipe
		#post method
		@recipe=Recipe.find_by_id(params[:recipe_id])
		if @recipe.nil?
			redirect_to "/customer_homes/index_recipe/1"
		end
	end
end
