require 'rails_helper'

RSpec.describe "Comments", type: :system do
  let(:user) { build(:user) }
  let(:board) { create(:board) }
  let(:comment) { create(:comment) }

  before do
    login_as(user)
  end

  describe '投稿にコメントをする' do
    context '正常系' do
      it 'コメントを入力して投稿をクリックするとコメントが表示される' do
        visit board_path(board)
        execute_script('window.scrollBy(0,2000)')
        sleep 1
        fill_in 'コメント ※150文字まで', with: comment.body
        click_on '投稿'
        expect(page).to have_content(comment.body)
        expect(current_path).to eq board_path(board)
      end
    end

    context '異常系' do
      it 'コメントを未入力で投稿をクリックするとコメントが表示されない' do
        visit board_path(board)
        execute_script('window.scrollBy(0,2000)')
        sleep 1
        fill_in 'コメント ※150文字まで', with: ''
        click_on '投稿'
        expect(page).to have_content('コメントを入力してください')
        expect(current_path).to eq board_path(board)
      end
      it 'コメントを151文字以上入力できない' do
        visit board_path(board)
        execute_script('window.scrollBy(0,2000)')
        sleep 1
        fill_in 'コメント ※150文字まで', with: 'あ' * 151
        click_on '投稿'
        expect(page).to have_content('あ' * 150)
        expect(current_path).to eq board_path(board)
      end
    end
  end
end
