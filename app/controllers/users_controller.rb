class UsersController < ApplicationController
	include SessionsHelper

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "You have created a new User."
			sign_in(@user)
		else
			flash.now[:danger] = "Invalid parameters."
			render 'new'  
		end
	end

	def show
		@user = User.find(params[:id])
	end
	
	private

	def user_params
		params.require(:user).permit(:name, :email)
	end
end
