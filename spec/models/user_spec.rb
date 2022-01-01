require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    let(:user) { create(:user) }
    context '正常系' do
      it '全項目問題なく入力されていればユーザー登録できる' do
        expect(user.valid?).to eq(true)
        expect(user.errors).to be_empty
      end
    end
    context '異常系' do
      it 'ニックネームが空文字ならバリデーションが成功する' do
        user.name = ''
        expect(user.valid?).to eq(false)
        expect(user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'メールアドレスが空文字ならバリデーションが成功する' do
        user.email = ''
        expect(user.valid?).to eq(false)
        expect(user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it 'メールアドレスが一意でなければバリデーションが成功する' do
        user1 = user
        user1.save
        user2 = User.new(name: 'test', email: user1.email, password: 'password', password_confirmation: 'password')
        expect(user2.valid?).to eq(false)
        expect(user2.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
      it 'パスワードが3文字以下ならバリデーションが成功する' do
        user.password = 'aaa'
        expect(user.valid?).to eq(false)
        expect(user.errors.full_messages).to include("パスワードは4文字以上で入力してください")
      end
      it 'パスワード確認が空文字ならバリデーションが成功する' do
        user.crypted_password = ''
        expect(user.valid?).to eq(false)
        expect(user.errors.full_messages).to include("パスワード確認を入力してください")
      end
      it 'はじめたきっかけが151文字以上ならバリデーションが成功する' do
        user.reason = 'あ' * 151
        expect(user.valid?).to eq(false)
        expect(user.errors.full_messages).to include("はじめたきっかけは150文字以内で入力してください")
      end
    end
  end
end
