require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    @schedule = FactoryBot.build(:schedule)
  end

  describe 'スケジュール新規作成' do
    context '新規作成が出来るとき' do
      it '撮影開始日、撮影終了日、client、title、contentが存在すれば登録できる' do
        expect(@schedule).to be_valid
      end
    end

    context '新規作成が出来ないとき' do
      it '撮影開始日が空だと登録出来ない' do
        @schedule.start_date = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include('撮影開始日を入力してください')
      end
      it '撮影終了日が空だと登録出来ない' do
        @schedule.end_date = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include('撮影終了日を入力してください')
      end
      it 'clientが空だと登録出来ない' do
        @schedule.client = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include('発注会社を入力してください')
      end
      it 'titleが空だと登録出来ない' do
        @schedule.title = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include('番組名を入力してください')
      end
      it 'contentが空だと登録出来ない' do
        @schedule.content = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include('内容を入力してください')
      end
    end
  end
end
