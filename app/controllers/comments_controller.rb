class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end

  def delete
    @post = post.find(params[:post_id])
    @comment = @post.comment.find(params[:id])
    @comment.destory
    redirect_to post_path(@post)

  end
end
