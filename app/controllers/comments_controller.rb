class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.create(params[:comment].permit(:content))
    @comment.user = current_user
    @comment.post = @post

    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end
end
