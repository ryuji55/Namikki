class BoardsController < ApplicationController
  def index
    @boards = Board.all.includes(:user).order(created_at: :desc).page(params[:page])
    @faborite = Favorite.new
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
  end

  private

  def board_params
    params.require(:board).permit(:point, :wave_size, :body)
  end
end
