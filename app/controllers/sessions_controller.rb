class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(name: params[:session][:name])
		if user 
			flash[:success] = "You have successfully signed in."
			sign_in user
			
		else
			flash.now[:danger] = "User does not exist by that name."
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to signin_url
	end

end
