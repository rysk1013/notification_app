class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      @posts = Post.includes(:user).order(created_at: :desc)
      render :index
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:text).merge(user_id: current_user.id)
  end
end
