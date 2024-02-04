require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
    end
    it 'emailが空では登録できない' do
    end
    it '重複したemailが存在する場合は登録できない' do
    end
    it 'emailは@を含まないと登録できない' do
    end
    it 'passwordが空では登録できない' do
    end
    it 'passwordが5文字以下では登録できない' do
    end
    it 'passwordは半角英数字混合でないと登録できない' do
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
    end
    it 'last_nameが空では登録できない' do
    end
    it 'first_nameが空では登録できない' do
    end
    it 'last_nameに全角以外を含むと登録できない' do
    end
    it 'first_nameに全角以外を含むと登録できない' do
    end
    it 'last_name_kanaが空では登録できない' do
    end
    it 'first_name_kanaが空では登録できない' do
    end
    it 'last_name_kanaに全角以外を含むと登録できない' do
    end
    it 'first_name_kanaに全角以外を含むと登録できない' do
    end
    it 'date_of_birthが空では登録できない' do
    end
  end
end
