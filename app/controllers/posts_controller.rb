class PostsController < ApplicationController
      before_action :correct_user,   only: :destroy
	def new
		if user_signed_in?
			@post = Post.new
		else
			redirect_to root_path
		end
	end

	def create
		@post = current_user.posts.new(params[:post].permit(:title, :text, :created_at))
		if @post.save
		  redirect_to @post
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def index
		@posts = Post.all
	end

	def edit
		if user_signed_in?
			@post = Post.find(params[:id])
		end
	end

	def update
  		@post = Post.find(params[:id])
 
  		if @post.update(params[:post].permit(:title, :text, :created_at))
    		redirect_to @post
  		else
    		render 'edit'
  		end
	end

	def destroy
			@post = current_user.posts.find_by(id: params[:id])
			@post.destroy

			redirect_to posts_path
	end

	private
	def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end

	def post_params
		params.require(:post).permit(:title, :text)
	end
	def require_login
 			unless signed_in?
  			redirect_to root_url
  		end
  	end
end
