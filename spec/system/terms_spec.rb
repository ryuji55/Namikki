require 'rails_helper'

RSpec.describe "Terms", type: :system do
  before do
    visit root_path
  end

  describe 'ページ遷移の確認' do
    context 'footerのプライバシーポリシーのリンクからアクセス' do
      it 'プライバシーポリシーのページが表示される' do
        execute_script('window.scrollBy(0,2000)')
        sleep 1
        click_on 'プライバシーポリシー'
        expect(page).to have_content('プライバシーポリシー')
        expect(current_path).to eq privacy_path
      end
    end

    context 'footerの利用規約のリンクからアクセス' do
      it '利用規約のページが表示される' do
        execute_script('window.scrollBy(0,2000)')
        sleep 1
        click_on '利用規約'
        expect(page).to have_content('利用規約')
        expect(current_path).to eq terms_path
      end
    end

    context 'footerのお問い合わせのリンクからアクセス' do
      it 'お問い合わせのページが表示される' do
        execute_script('window.scrollBy(0,2000)')
        sleep 1
        click_on 'お問い合わせ'
        expect(page).to have_content('お問い合わせ')
        expect(current_path).to eq new_contact_path
      end
    end
  end
end
