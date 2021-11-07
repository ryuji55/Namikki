class BoardsController < ApplicationController
  def index
    @boards = Board.all.includes(:user).order(created_at: :desc).page(params[:page])
    @faborite = Favorite.new
  end

  def create
    @board = Board.new
    @board.user_id = current_user.id
  end

  def show
    @board = Board.find(params[:id])
  end
end
