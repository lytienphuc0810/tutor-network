class AdminsController < ApplicationController
	def customer_posts 
		@customer_posts=CustomerPost.paginate(:page => params[:page])
	end

	def customer_posts_allow
		customer_post = CustomerPost.find params[:post_id]
		customer_post.allow = true
		customer_post.save
		render "customer_posts"
	end

	def customer_posts_refuse
		customer_post = CustomerPost.find params[:post_id]
		customer_post.allow = false
		customer_post.save
		render "customer_posts"
	end

	def tutor_posts
		@tutor_post=TutorPost.paginate(:page => params[:page])
	end

	def tutor_posts_allow
		tutor_post = TutorPost.find params[:post_id]
		tutor_post.allow = true
		tutor_post.save
		render "tutor_posts"
	end

	def tutor_posts_refuse
		tutor_post = TutorPost.find params[:post_id]
		tutor_post.allow = false
		tutor_post.save
		render "tutor_posts"
	end
end
	
