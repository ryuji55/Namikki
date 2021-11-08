class FavoritesController < ApplicationController
  before_action :set_board
  def create
    @favorite = Favorite.create(board_id: params[:board_id], user_id: current_user.id)
    redirect_back(fallback_location: boards_path)
  end

  def destroy
    @favorite = Favorite.find_by(board_id: params[:board_id], user_id: current_user.id)
    @favorite.destroy
    redirect_back(fallback_location: boards_path)
  end

   private

  def set_board
    @board = Board.find_by(id: params[:board_id])
  end
end
