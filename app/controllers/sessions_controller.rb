class SessionsController < ApplicationController
	# Create session 
	def create
		@user = User.where("username = '#{params[:username]}'").first

		if @user && @user.password == params[:password]
   # "WELCOME #{@user.fname}!"
   session[:user_id] = @user.id
   redirect_to '/posts/new'
		else
			flash[:notice] = "Invalid username or password"
			redirect_to '/'
		end
	end
	def destroy
		session.destroy
		flash[:notice] = "You are now logged out"
		redirect_to '/'	
	end	

end
