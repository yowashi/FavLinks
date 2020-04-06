class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]

  def top
  end

  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @posts = @category.posts.all.reverse_order
      @categories = Category.all
    else
  	 @posts = Post.all.reverse_order
  	 @categories = Category.all
    end
  end

  def new
  	@post = Post.new
    @category = Category.all
  end

  def create
  	post = Post.new(post_params)
    post.user_id = current_user.id
  	post.save!
  	redirect_to posts_path
  end

  def show
  	@post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def edit
  	@post = Post.find(params[:id])
    @category = Category.all
  end

  def update
  	post = Post.find(params[:id])
  	post.update(post_params)
  	redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
  	params.require(:post).permit(:title,:content,:rate,:image,:category_id,:user_id)
  end
end
