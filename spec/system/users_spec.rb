require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { build(:user) }
  let!(:board) { create(:board) }

  describe 'ログイン前' do
    before do
      visit root_path
    end
    describe 'ページ遷移確認' do
      context 'Namikkiを投稿するのボタンから投稿ページにアクセス' do
        it 'Namikki投稿ページのアクセスに失敗する' do
          click_on 'Namikkiを投稿する'
          expect(page).to have_content('ログインしてください')
          expect(current_path).to eq login_path
        end
      end

      context '登録する前にNamikkiを見てみるから一覧ページにアクセス' do
        it 'Namikki一覧ページが表示される' do
          execute_script('window.scrollBy(0,800)')
          sleep 1
          click_on '登録する前にNamikkiを見てみる'
          expect(current_path).to eq boards_path
        end
      end

      context 'ヘッダーのNamikkiをクリックして一覧ページにアクセス' do
        it 'Namikki一覧ページが表示される' do
          click_on 'Namikki'
          expect(current_path).to eq boards_path
        end
      end

      context 'ヘッダーのSigninをクリックしてユーザー登録ページにアクセス' do
        it 'ユーザー登録ページが表示される' do
          click_on 'Signin'
          expect(page).to have_content('ユーザー登録')
          expect(current_path).to eq new_user_path
        end
        it 'すでに登録がお済みの方はこちらをクリックするとログインページが表示される' do
          click_on 'Signin'
          execute_script('window.scrollBy(0,800)')
          sleep 1
          click_on 'すでに登録がお済みの方はこちら'
          expect(page).to have_content('ログイン')
          expect(current_path).to eq login_path
        end
      end

      context 'ヘッダーのLoginをクリックしてログインページにアクセス' do
        it 'ログインページが表示される' do
          click_on 'Login'
          expect(page).to have_content('ログイン')
          expect(current_path).to eq login_path
        end
        it 'パスワードをお忘れの方はこちらをクリックするとパスワード再設定ページが表示される' do
          click_on 'Login'
          execute_script('window.scrollBy(0,800)')
          sleep 1
          click_on 'パスワードをお忘れの方はこちら'
          expect(page).to have_content('パスワードの再設定')
          expect(current_path).to eq new_password_reset_path
        end
        it 'ユーザー登録がまだお済みでない方はこちらをクリックするとユーザー登録ページが表示される' do
          click_on 'Login'
          execute_script('window.scrollBy(0,800)')
          sleep 1
          click_on 'ユーザー登録がまだお済みでない方はこちら'
          expect(page).to have_content('ユーザー登録')
          expect(current_path).to eq new_user_path
        end
      end
    end

    describe 'ユーザー新規登録' do
      context 'フォームの入力値が正常' do
        it 'ユーザー登録が成功する' do
          visit new_user_path
          fill_in 'ニックネーム', with: user.name
          fill_in 'メールアドレス', with: user.email
          fill_in 'パスワード     ※4文字以上', with: "password"
          fill_in 'パスワード確認', with: "password"
          click_button '登録'
          expect(page).to have_content('ユーザー登録が完了しました')
          expect(current_path).to eq root_path
        end
      end

      context '登録済みのメールアドレスを使用' do
        it 'ユーザー登録に失敗する' do
          exited_user = create(:user)
          visit new_user_path
          fill_in 'ニックネーム', with: user.name
          fill_in 'メールアドレス', with: exited_user.email
          fill_in 'パスワード     ※4文字以上', with: "password"
          fill_in 'パスワード確認', with: "password"
          click_button '登録'
          expect(page).to have_content('メールアドレスはすでに存在します')
          expect(current_path).to eq users_path
        end
      end
    end

    describe 'Mypageへのアクセス' do
      context 'リンクはないがURL入力でアクセスした場合' do
        it 'Mypageへのアクセスが失敗する' do
          visit profile_path
          expect(page).to have_content('ログインしてください')
          expect(current_path).to eq login_path
        end
      end
    end

    describe 'コメントページへのアクセス' do
      context 'リンクからではなくURL入力でアクセスした場合' do
        it 'コメントページへのアクセスが失敗する' do
          visit board_path(board)
          expect(page).to have_content('ログインしてください')
          expect(current_path).to eq login_path
        end
      end

      context '投稿をクリックしてコメントページへアクセスした場合' do
        it 'コメントページへのアクセスが失敗する' do
          visit boards_path
          find('.card').click
          expect(page).to have_content('ログインしてください')
          expect(current_path).to eq login_path
        end
      end
    end
  end

  describe 'ログイン後' do
    before do
      login_as(user)
    end
    describe 'ページ遷移確認' do
      context 'ヘッダーのMypageをクリックしてマイページにアクセス' do
        it 'マイページが表示される' do
          click_on 'Mypage'
          expect(page).to have_content('namikki')
          expect(current_path).to eq profile_path
        end
        it 'プロフィール編集ページをクリックするとプロフィール編集ページが表示される' do
          click_on 'Mypage'
          execute_script('window.scrollBy(0,800)')
          sleep 1
          click_on 'プロフィール編集ページ'
          expect(page).to have_content('プロフィール編集ページ')
          expect(current_path).to eq edit_profile_path
        end
      end

      context 'ヘッダーのNamikkiをクリックして一覧ページにアクセス' do
        it 'Namikki一覧ページが表示される' do
          sleep 5
          click_on 'Namikki'
          expect(current_path).to eq boards_path
        end
      end

      context 'まずプロフィールを登録するをクリックしてプロフィール編集ページにアクセス' do
        it 'プロフィール編集ページが表示される' do
          execute_script('window.scrollBy(0,800)')
          sleep 1
          click_on 'まずプロフィールを登録する'
          expect(page).to have_content('プロフィール編集ページ')
          expect(current_path).to eq edit_profile_path
        end
        it 'フォーム全項目入力したらプロフィールの編集が行える' do
          avatar_path = Rails.root.join('spec/fixtures/image/test.jpeg').to_s
          execute_script('window.scrollBy(0,800)')
          sleep 1
          click_on 'まずプロフィールを登録する'
          attach_file "user[avatar]", avatar_path, make_visible: true
          select "1年", from: "user_history"
          execute_script('window.scrollBy(0,800)')
          fill_in "はじめたきっかけ ※150文字まで", with: user.reason
          click_on '登録'
          expect(page).to have_content('プロフィールを編集しました')
          expect(current_path).to eq profile_path
        end
      end

      context '投稿をクリックしてコメントページへアクセスした場合' do
        it 'コメントページが表示される' do
          visit boards_path
          find('.card').click
          expect(current_path).to eq board_path(board)
        end
      end
    end

    describe 'プロフィール編集機能' do
      context 'フォームの入力値が正常' do
        it 'フォーム全項目入力したらプロフィールの編集が行える' do
          avatar_path = Rails.root.join('spec/fixtures/image/test.jpeg').to_s
          execute_script('window.scrollBy(0,800)')
          sleep 1
          click_on 'まずプロフィールを登録する'
          attach_file "user[avatar]", avatar_path, make_visible: true
          select "1年", from: "user_history"
          execute_script('window.scrollBy(0,800)')
          fill_in "はじめたきっかけ ※150文字まで", with: user.reason
          click_on '登録'
          expect(page).to have_content('プロフィールを編集しました')
          expect(current_path).to eq profile_path
        end
      end
    end
  end
end
