class NoticesController < ApplicationController
  def index
    @notices = current_user.passive_notices.eager_load(board: :user).page(params[:page])
    @notices.where(checked: false).each do |notice|
      notice.update(checked: true)
    end
  end
end
