class UserPostController < ApplicationController
	def new_customer_post
		#get method
		@user = user.find(params[:user_id])
		if @user.nil?
			# send error message
		end
	end
			 	
	def index_customer_post
		#get method
		@user = user.find(params[:user_id])
		if @user.nil?
			# send error message
		else
			@customer_posts = @user.customer_posts.paginate(:page => params[:page])
			if @customer_posts.empty?
				# error message 
				redirect_to "/users/show/#{params[:user_id]}"
			end
		end
	end

	def show_customer_post
		#get method
	end

	def edit_customer_post
		#get method
		@customer_post = userInstance.find(params[:customer_post_id])
		if @customer_post.nil?
			# error message
		end
	end

	def update_customer_post
		#post method
		customer_post = userInstance.find(params[:customer_post_id])
		if customer_post.nil?
			# send error message
		else
			if customer_post.update_attributes(params[:customer_post])
				redirect_to "/user_posts/index/#{customer_post.user.id}/1"
			else
				# send error message
			end
		end
	end

	def create_customer_post
		#post method
		customer_post = CustomerPost.create(params[:customer_post])
		if customer_post.nil?
			# send error message
		else
			user = User.find(params[:user])
			user.customer_posts = user.customer_posts << customer_post
			if user.save
				redirect_to "/user_post/index/#{user.id}/1"
			else
				# send error message
			end
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
	end
end
