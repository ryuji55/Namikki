class NoticesController < ApplicationController
  def index
    @notices = current_user.passive_notices.includes({board: :user}, :visitor, :board).page(params[:page])
    @notices.where(checked: false).each do |notice|
      notice.update(checked: true)
    end
  end
end
