class CommentsController < ApplicationController

	def create
		post = Post.find(params[:post_id])
		@comment = post.comments.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			flash[:success] = "コメントしました"
			redirect_to post_path(post)
		else
			flash[:alert] = "コメントに失敗しました"
			redirect_to post_path(post)
		end
	end

	def destroy
		post = Post.find(params[:post_id])
		comment = Comment.find(params[:id])
		comment.destroy
		redirect_to post_path(post)
	end

	def comment_params
		params.require(:comment).permit(:content)
	end
end