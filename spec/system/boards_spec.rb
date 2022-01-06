require 'rails_helper'

RSpec.describe "Boards", type: :system do
  let(:user) { build(:user) }
  let(:board) { build(:board) }
  image_path = Rails.root.join('spec/fixtures/image/test.jpeg').to_s

  before do
    login_as(user)
  end
  describe '投稿機能' do
    context '正常系' do
      it 'すべて選択されていれば投稿ができる' do
        click_on "Namikkiを投稿する"
        select "ロングビーチ", from: "board_point"
        select "フラット", from: "board_wave_size"
        execute_script('window.scrollBy(0,800)')
        fill_in "コメント", with: "楽しかった"
        attach_file "board[image]", image_path, make_visible: true
        sleep 1
        click_on "投稿"
        expect(page).to have_content "投稿が完了しました"
      end
      it '名前がデフォルトで入力されていてポイントと波のサイズを選択すれば投稿ができる' do
        click_on "Namikkiを投稿する"
        select "ロングビーチ", from: "board_point"
        select "フラット", from: "board_wave_size"
        execute_script('window.scrollBy(0,800)')
        sleep 1
        click_on "投稿"
        expect(page).to have_content "投稿が完了しました"
      end
    end
    context '異常系' do
      it 'ポイントを選択していないと投稿ができない' do
        click_on "Namikkiを投稿する"
        select "フラット", from: "board_wave_size"
        execute_script('window.scrollBy(0,800)')
        sleep 1
        click_on "投稿"
        expect(page).to have_content "ポイントを入力してください"
      end
      it '波のサイズを選択していないと投稿ができない' do
        click_on "Namikkiを投稿する"
        select "ロングビーチ", from: "board_point"
        execute_script('window.scrollBy(0,800)')
        sleep 1
        click_on "投稿"
        expect(page).to have_content "波のサイズを入力してください"
      end
    end
  end
end
