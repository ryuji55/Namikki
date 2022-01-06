require 'rails_helper'

RSpec.describe "Favorites", type: :system do
  let(:user) { build(:user) }
  let!(:board) { create(:board) }
  before do
    login_as(user)
  end

  describe 'いいね機能' do
    context 'いいねをつける' do
      it '投稿のハートをクリックするとハートの数字が増える' do
        visit boards_path
        find('.fav-btn').click
        expect(page).to have_content('1')
        expect(current_path).to eq boards_path
      end
    end

    context 'いいねを取り消す' do
      it 'いいね済みの投稿のハートをクリックするとハートの数字が減る' do
        visit boards_path
        find('.fav-btn').click
        find('.fav-btn').click
        expect(page).to have_content('0')
        expect(current_path).to eq boards_path
      end
    end
  end
end
