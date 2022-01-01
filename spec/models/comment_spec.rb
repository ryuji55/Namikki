require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーション' do
    let(:comment) { build(:comment) }
    context '正常系' do
      it 'コメントが投稿できる' do
        expect(comment.valid?).to eq(true)
      end
    end
    context '異常系' do
      it '' do
      end
    end
  end
end
