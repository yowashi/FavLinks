class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]

  def top
  end

  PER = 6
  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @posts = @category.posts.page(params[:page]).per(PER).reverse_order
      @categories = Category.all
      @user = current_user
      @post = Post.new
    else
  	 @posts = Post.page(params[:page]).per(PER).reverse_order
  	 @post = Post.new
     @categories = Category.all
     @category = Category.new
     @user = current_user
    end
  end

  def new
  	@post = Post.new
    @category = Category.all
  end

  def create
  	@post = Post.new(post_params)
    @post.user_id = current_user.id
  	if @post.save
      redirect_to post,notice: "投稿しました"
    else
      @categories = Category.all
      @user = current_user
      @posts = Post.page(params[:page]).per(PER).reverse_order
      render 'index'
    end
  end

  def show
  	@post = Post.find(params[:id])
    @user= @post.user
    @comments = @post.comments
    @comment = Comment.new
    @like = Like.new
    @categories = Category.all
  end

  def edit
  	@post = Post.find(params[:id])
    @category = Category.all
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
      redirect_to post_path(post),notice: '更新しました'
    else
      @category = Category.all
      render 'edit'
    end
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
