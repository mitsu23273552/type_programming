require 'rails_helper'

RSpec.describe Game, type: :model do
  describe '#create' do
    before do
      @game = FactoryBot.build(:game)
    end

    context '登録に成功' do
      it '1st,2nd,3rdのスコアが存在すれば登録できること' do
        expect(@game).to be_valid
      end
    end

    context '登録に失敗' do
      it 'ユーザー情報が紐付いていないと保存できないこと' do
        @game.user = nil
        @game.valid?
        expect(@game.errors.full_messages).to include('ユーザー情報を入力してください')
      end

      it 'record_1stが存在しないと保存できないこと' do
        @game.record_1st = nil
        @game.valid?
        expect(@game.errors.full_messages).to include('Record 1stを入力してください')
      end

      it 'record_1stに数字以外が入力されていると保存できないこと' do
        @game.record_1st = "あアabc"
        @game.valid?
        expect(@game.errors.full_messages).to include('Record 1stは数値で入力してください')
      end

      it 'record_2ndが存在しないと保存できないこと' do
        @game.record_2nd = nil
        @game.valid?
        expect(@game.errors.full_messages).to include('Record 2ndを入力してください')
      end

      it 'record_2ndに数字以外が入力されていると保存できないこと' do
        @game.record_2nd = "あアabc"
        @game.valid?
        expect(@game.errors.full_messages).to include('Record 2ndは数値で入力してください')
      end

      it 'record_3rdが存在しないと保存できないこと' do
        @game.record_3rd = nil
        @game.valid?
        expect(@game.errors.full_messages).to include('Record 3rdを入力してください')
      end

      it 'record_3rdに数字以外が入力されていると保存できないこと' do
        @game.record_3rd = "あアabc"
        @game.valid?
        expect(@game.errors.full_messages).to include('Record 3rdは数値で入力してください')
      end
    end
  end
end
