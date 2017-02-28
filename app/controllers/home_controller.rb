class HomeController < ApplicationController
	def index
		if session[:user_id]
		current_user
		end
		# @current_user = session[:user_id] && User.find(session[:user_id])
	end
end
