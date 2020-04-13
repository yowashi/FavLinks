class UsersController < ApplicationController
	before_action :correct_user, only: [:edit, :update]

	def about
	end

	PER = 2
	def show
		@user = User.find(params[:id])
		@post = @user.liked_posts.page(params[:page]).per(PER).reverse_order
		@posts = @user.posts.page(params[:page]).per(PER).reverse_order
		@categories = Category.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
		redirect_to @user,notice: 'ユーザー情報を更新しました'
		else
		render 'edit'
		end
	end

	private
	def user_params
		params.require(:user).permit(:name,:image,:introduction)
	end

	def correct_user
		user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user.id)
    end
  end
end
