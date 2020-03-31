class UsersController < ApplicationController
	before_action :correct_user, only: [:edit, :update]

	def about
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.update(user.params)
		redirect_to user
	end

	private
	def user_params
		params.require(:user).permit(:name,:user_image,:introduction)
	end

	def correct_user
		user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user.id)
    end
  end
end
