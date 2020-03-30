class PostsController < ApplicationController

  def top
  end

  def index
  	@posts = Post.all
  	@category = Category.all
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
  	params.require(:post).permit(:title,:content,:rate,:image_id,:category_id,:user_id)
  end
end
