class ModsController < ApplicationController
	before_filter :authorized_user?

	def authorized_user?
		redirect_to(root_path) unless current_user && current_user.mod?
	end

	def index_customer_post 
		@customer_posts=CustomerPost.paginate(:page => params[:page])
	end

	def show_customer_post
		#get method
		@customer_post=CustomerPost.find_by_id(params[:customer_post_id])
		if @customer_post.nil?
			redirect_to "/mods/index_customer_post/1"
		end
	end

	def publish_customer_post
		customer_post = CustomerPost.find params[:post_id]
		customer_post.published = true
		customer_post.save
		redirect_to "/mods/index_customer_post/1"
	end

	def refuse_customer_post
		customer_post = CustomerPost.find params[:post_id]
		customer_post.published = false
		customer_post.save
		redirect_to "/mods/index_customer_post/1"
	end

	def index_tutor_post
		@tutor_posts=TutorPost.paginate(:page => params[:page])
	end

	def show_tutor_post
		#get method
		@tutor_post=TutorPost.find_by_id(params[:tutor_post_id])
		if @tutor_post.nil?
			redirect_to "/mods/index_tutor_post/1"
		end
	end

	def publish_tutor_post
		tutor_post = TutorPost.find params[:post_id]
		tutor_post.published = true
		tutor_post.save
		redirect_to "/mods/index_tutor_post/1"
	end

	def refuse_tutor_post
		tutor_post = TutorPost.find params[:post_id]
		tutor_post.published = false
		tutor_post.save
		redirect_to "/mods/index_tutor_post/1"
	end
end
	
