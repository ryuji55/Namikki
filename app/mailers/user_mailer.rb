class UserMailer < ApplicationMailer
  def reset_password_email(user)
    @user = User.find(user.id)
    @url  = edit_password_reset_url(@user.reset_password_token)
    mail(to: user.email, subject: 'パスワードリセット')
  end

  def contact_mail
    @email = params[:email]
    @title = params[:title]
    @body = params[:body]
    mail(to: [params[:email]], subject: 'お問い合わせありがとうございます')
  end
end
