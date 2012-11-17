class UsersController < ApplicationController
	before_filter :authenticate_user!
	def welcome
	end

	def index
		@users = User.paginate(:page => params[:page])
	end

	def show
		@user = User.find_by_id(params[:user_id])
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find_by_id(params[:user_id])
	end

	def update
		@user = User.find_by_id(params[:user_id])
		if(@user.update_attributes(params[:user]))
			redirect_to "/users/show/#{@user.id}"
		else
			render action: "edit"
		end
	end

	def create
		@user = User.new(params[:user])
		if(@user.save)
			redirect_to "/users/show/#{@user.id}"
		else
			render action: "new"
		end
	end

	def delete
		user = User.find_by_id(params[:user_id])
		user.delete
		redirect_to '/users/index/1'
	end
end
