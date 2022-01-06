module LoginMacros
  def login_as(user)
    visit new_user_path
    fill_in 'ニックネーム', with: user.name
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード     ※4文字以上', with: "password"
    fill_in 'パスワード確認', with: "password"
    click_button '登録'
  end
end
