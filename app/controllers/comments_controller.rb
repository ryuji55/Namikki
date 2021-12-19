class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @board = @comment.board
    @comment.save
    @board.create_notice_comment!(current_user, @comment.id)
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(board_id: params[:board_id])
  end
end
