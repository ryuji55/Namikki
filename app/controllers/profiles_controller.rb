class ProfilesController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: 'プロフィールを編集しました'
    else
      flash.now['danger'] = 'プロフィールの編集に失敗しました'
      render :edit
    end
  end

  def show
    @boards = Board.includes(:user).where(user_id: current_user.id).order(created_at: :desc).page(params[:page])
  end

  def destroy
    @board = current_user.boards.find(params[:board_id])
    @board.destroy!
    redirect_to profile_path, success: '投稿を削除しました'
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :avatar, :history, :reason)
  end
end
