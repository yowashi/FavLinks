class LikesController < ApplicationController

	def create
		@like = Like.new(user_id: @current_user.id, post_id: params(:post_id))
		@like.save
		@post = Post.find_by(id: @like.food_id)
		@like_count = Like.where(food_id: params(:post_id)).count
	end

	def delete
		@like = Like.find_by(user_id: @current_user.id, post_id: params(:post_id))
		@post = Post.find_by(id: @like.post_id)
		@like.destroy
		@like_count = Like.where(post_id: params(:post_id)).count
	end

end
