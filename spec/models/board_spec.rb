require 'rails_helper'

RSpec.describe Board, type: :model do
  describe 'バリデーション' do
    let(:board) { build(:board) }
    context '正常系' do
      it 'ポイントと波のサイズが選択されていれば投稿ができる' do
        expect(board.valid?).to eq(true)
        expect(board.errors).to be_empty
      end
    end
    context '異常系' do
      it 'ポイントが選択されていないとバリデーションが成功する' do
        board.point = ''
        expect(board.valid?).to eq(false)
        expect(board.errors.full_messages).to include("ポイントを入力してください")
      end
      it '波のサイズが選択されていないとバリデーションが成功する' do
        board.wave_size = ''
        expect(board.valid?).to eq(false)
        expect(board.errors.full_messages).to include("波のサイズを入力してください")
      end
    end
  end
end
