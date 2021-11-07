class FavoritesController < ApplicationController
def create
    @favorites = current_user.favorites.create(board_id: params[:board_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @faborite = Faborite.find_by(board_id: params[:board_id], user_id: current_user.id)
    @faborite.destroy
    redirect_back(fallback_location: root_path)
  end
end
