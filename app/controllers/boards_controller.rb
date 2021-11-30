class BoardsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  def index
    @boards = Board.includes(:user).order(created_at: :desc).page(params[:page])
    @favorite = Favorite.new
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, success: '投稿が完了しました'
    else
      flash.now['danger'] = '投稿に失敗しました'
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new
    @comments = @board.comments.includes(:user).order(created_at: :desc)
  end

  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy!
    redirect_to boards_path, success: '投稿を削除しました'
  end

  private

  def board_params
    params.require(:board).permit(:point, :wave_size, :body, :image)
  end
end
