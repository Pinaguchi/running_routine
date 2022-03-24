class PostCommentsController < ApplicationController
  
  def create
    record = Record.find(params[:record_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.record_id = record.id
    comment.save
    redirect_to users_path
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
