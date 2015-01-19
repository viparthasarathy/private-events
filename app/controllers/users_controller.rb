class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new
		if @user.save
			flash[:success] = "You have created a new User."
			redirect_to @user
		else
			render 'new'  
		end
	end

	def show
		@user = User.find(params[:id])
	end
	
end