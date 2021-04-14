require 'rails_helper'

RSpec.describe Question, type: :model do
  describe '#create' do
    before do
      @question = FactoryBot.build(:question)
    end

    context '登録に成功' do
      it '問題文、回答コード、解説、難易度が存在すれば登録できること' do
        expect(@question).to be_valid
      end
    end

    context '登録に失敗' do
      it 'ユーザー情報が紐付いていないと保存できないこと' do
        @question.user = nil
        @question.valid?
        expect(@question.errors.full_messages).to include('ユーザー情報を入力してください')
      end

      it '問題文が入力されていないと保存できないこと' do
        @question.title = nil
        @question.valid?
        expect(@question.errors.full_messages).to include('問題文を入力してください')
      end

      it '回答コードが入力されていないと保存できないこと' do
        @question.answer = nil
        @question.valid?
        expect(@question.errors.full_messages).to include('回答コードを入力してください')
      end

      it '回答コードにかなカナ漢字が入力されていると保存できないこと' do
        @question.answer = "あア一"
        @question.valid?
        expect(@question.errors.full_messages).to include('回答コードは不正な値です')
      end

      it '解説が入力されていないと保存できないこと' do
        @question.commentary = nil
        @question.valid?
        expect(@question.errors.full_messages).to include('解説を入力してください')
      end

      it '配送料が選択されていないと保存できないこと' do
        @question.question_level_id = 0
        @question.valid?
        expect(@question.errors.full_messages).to include('難易度を選択してください')
      end
    end
  end
end
