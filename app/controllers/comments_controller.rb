class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      render "posts/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(post_id: params[:post_id], user_id: current_user.id)
  end
end
