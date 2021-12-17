class FavoritesController < ApplicationController
  before_action :set_board

  def create
      @favorite = current_user.favorites.create(board_id: params[:board_id])
      @board.create_notice_favorite!(current_user)
  end

  def destroy
    @favorite = current_user.favorites.find_by(board_id: params[:board_id])
    @favorite.destroy
  end

  private

  def set_board
    @board = Board.find_by(id: params[:board_id])
  end
end
