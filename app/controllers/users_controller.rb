class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[index new create edit update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @boards = Board.where(user_id: current_user.id).order(created_at: :desc).page(params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: 'ユーザー登録が完了しました'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :avatar)
  end

  def mypage_params
    params.require(:user).permit(:name, :avatar, :history, :reason)
  end
end
