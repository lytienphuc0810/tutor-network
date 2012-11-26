class ModsController < ApplicationController
	before_filter :authorized_user?

	def authorized_user?
		redirect_to(root_path) unless current_user && current_user.mod?
	end

	def index_customer_post 
		@customer_posts=CustomerPost.paginate(:page => params[:page])
	end

	def publish_customer_post
		customer_post = CustomerPost.find params[:post_id]
		customer_post.published = true
		customer_post.save
		render "customer_posts"
	end

	def refuse_customer_post
		customer_post = CustomerPost.find params[:post_id]
		customer_post.published = false
		customer_post.save
		render "customer_posts"
	end

	def index_tutor_pos
		@tutor_post=TutorPost.paginate(:page => params[:page])
	end

	def publish_tutor_post
		tutor_post = TutorPost.find params[:post_id]
		tutor_post.published = true
		tutor_post.save
		render "tutor_posts"
	end

	def refuse_tutor_post
		tutor_post = TutorPost.find params[:post_id]
		tutor_post.published = false
		tutor_post.save
		render "tutor_posts"
	end
end
	
