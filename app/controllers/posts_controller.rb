class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

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
    @already_liked = Like.find_by(post_id: @post.id, user_id: current_user.id) if user_signed_in?
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      @post = Post.find(params[:id])
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:text).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
