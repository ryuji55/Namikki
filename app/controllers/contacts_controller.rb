class ContactsController < ApplicationController
  skip_before_action :require_login
  def new; end

  def create
     if params[:email].present?
      UserMailer.with(email: params[:email],title: params[:title], body: params[:body]).contact_mail.deliver_now
      redirect_to root_path, success: 'メールを送信しました'
    else
      flash.now[:danger] = 'メールが送信できませんでした'
      render :new
    end
  end
end
