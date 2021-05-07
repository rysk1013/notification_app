class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      @post.create_notification_comment!(current_user, @comment.id)
      redirect_to post_path(@post)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id)
  end
end
