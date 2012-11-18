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
		#get method
		@tutor_posts=TutorPost.paginate(:page => params[:page])
	end

	def show_tutor_post
		#get method
		@tutor_post=TutorPost.find_by_id(params[:tutor_post_id])
	end

	def edit_tutor_post
		#get method
	end

	def update_tutor_post
		#post method
	end

	def create_tutor_post
		#post method
    @tutor_post = TutorPost.new(params[:tutor_post])
    if(@tutor_post.save)
      redirect_to "/tutor_posts/show/#{@tutor_post.id}"
    else
      render action: "new"
    end
	end

	def delete_tutor_post
		#post method
	end
end