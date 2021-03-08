class PostsController < ApplicationController
  before_action :ensure_logged_in, only: [:new, :create, :edit, :update, :delete]

  def new
    @post = Post.new
  end

  def create
 
    @post = Post.new(title: post_params[:title], url: post_params[:url], content: post_params[:content], sub_id: post_params[:sub_id], author_id: current_user.id)
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update

    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end

  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to sub_posts_url(post_params[:sub_id])
  end

  def index
    @posts = Post.find_by(sub_id: params[:sub_id])
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  private
  
  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id)
  end

end
