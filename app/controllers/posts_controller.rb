class PostsController < ApplicationController
	before_filter :post, only: [:show, :destroy, :edit, :update]
	# def show
	# end   
	def index
		@posts = Post.all 
	end
	def create
		Post.create(post_params)
		redirect_to '/posts'	
	end
	def destroy
		begin
		rescue
		end
		if @post && @post.destroy
			flash[:notice] = "Your post has been deleted!"
		else
			flash[:notice] = "Sorry, we could not delete your post"
		end
		redirect_to posts_path
	end
	# def edit
	# end
	def update
		@post.update(post_params
			)
		flash[:notice] = "Post Updated Congrats"
		redirect_to '/posts'
	end
	private
	def post_params
		params.require(:post).permit(:text,:title,:image).merge(user_id: current_user.id)
	end
end
