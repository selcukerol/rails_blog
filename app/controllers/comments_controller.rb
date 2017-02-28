class CommentsController < ApplicationController
	def create
		Comment.create(
			text: params[:text],
			user_id: current_user.id,
			post_id: params[:post_id]
			)
		redirect_to '/posts'	
	end
	def show
		@comment = Comment.find(params[:id])
	end	
end
