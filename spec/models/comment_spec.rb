require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーション' do
    let(:comment) { build(:comment) }
    context '正常系' do
      it 'コメントが投稿できる' do
        expect(comment.valid?).to eq(true)
        expect(comment.errors).to be_empty
      end
    end
    context '異常系' do
      it 'コメントが空文字だとバリデーションが成功する' do
        comment.body = ''
        expect(comment.valid?).to eq(false)
        expect(comment.errors.full_messages).to include("コメントを入力してください")
      end
      it 'コメントが151文字以上ならバリデーションが成功する' do
        comment.body = 'あ' * 151
        expect(comment.valid?).to eq(false)
        expect(comment.errors.full_messages).to include("コメントは150文字以内で入力してください")
      end
    end
  end
end
