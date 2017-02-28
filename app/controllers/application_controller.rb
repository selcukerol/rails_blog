class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	def current_user
		if session[:user_id]
			@current_user = User.find(session[:user_id])
		end
	end
	def post
		@post = Post.find(params[:id])	
	end
	helper_method :current_user
	helper_method :post  
end
