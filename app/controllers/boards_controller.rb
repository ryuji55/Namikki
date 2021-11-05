class BoardsController < ApplicationController
  def index
    @boards = Board.all.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def show
    @board = Board.find(params[:id])
  end
end
