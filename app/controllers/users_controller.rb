class UsersController < ApplicationController
	before_filter :is_admin, only: [:index]
	def show
		@user = User.find(params[:id])   
	end   
	def index
		@users = User.all   
	end
	def create
		@user = User.new(user_params)
		if @user.save
		flash[:notice] = "Congrats on your new account"
		redirect_to '/'
		else
		render :new
		end	
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		if(@user.password == params[:user][:password] && params[:user][:new_password].length > 0)
			@user.update(user_params.reject{|k| k.include? "password"}.merge( password: params[:user][:new_password]))
		end
		flash[:notice] = "Profile Updated Congrats"
		redirect_to '/'
	end
	def destroy
		begin
			@user = User.find(params[:id])
		rescue
		end
		if @user.id == session[:user_id]
			session.destroy
		end
		if @user && @user.destroy
			flash[:notice] = "Your account has been deleted!"
		else
			flash[:notice] = "Sorry, we could not delete you"
		end
		redirect_to users_path
	end
	private
	def user_params
		params.require(:user).permit(:fname,:lname,:dob,:username,:password)
	end
	def is_admin
		redirect_to '/' unless current_user && current_user.admin
	end
end	
