class CommentsController < ApplicationController
  before_action :correct_user,   only: :destroy

  def create
    if user_signed_in?
      @post = Post.find(params[:post_id])
      @comment = current_user.comments.create(params[:comment].permit(:body, :post_id))
      if @post.save
        redirect_to root_path
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    if user_signed_in?
  	 @post = Post.find(params[:post_id])
  	 @comment = @post.comments.find(params[:id])
  	 @comment.destroy
  	 redirect_to post_path(@post)
    end
  end

  private

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end