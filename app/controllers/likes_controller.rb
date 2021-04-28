class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @already_liked = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like = Like.create(post_id: params[:post_id], user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end
end
