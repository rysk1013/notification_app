class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_already_liked, only: [:create, :destroy]

  def create
    @like = Like.create(post_id: params[:post_id], user_id: current_user.id)
    post = Post.find(params[:post_id])
    post.create_notification_like!(current_user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @already_liked.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def set_already_liked
    @already_liked = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
  end
end
