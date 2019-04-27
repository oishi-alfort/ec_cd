class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to cd_path(params[:cd_id])
		else
			flash[:notice] = "Error!"
			redirect_to cd_path(params[:cd_id])
		end
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update(comment_params)
			redirect_to cd_path(@comment.cd_id)
		else
			flash[:notice] = "Reply Update error!"
			redirect_to cd_path(@comment.cd_id)
		end
	end

	def destroy
		@cd = Cd.find_by(params[:cd_id])
		comment = Comment.find(params[:id])
		comment.destroy
		redirect_to cd_path(@cd)
	end

	private
  	def comment_params
  	params.require(:comment).permit(:comment_body, :user_id, :cd_id)
  	end
end
