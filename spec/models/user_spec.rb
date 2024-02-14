require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規投稿できるとき' do
      it 'nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、date_of_birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規投稿できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'nakamuratomoshi'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'tn00'
        @user.password_confirmation = 'tn00'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角数字のみの場合は登録できない' do
        @user.password = '20000509'
        @user.password_confirmation = '20000509'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include both letters and numbers')
      end
      it 'passwordは半角英字のみの場合は登録できない' do
        @user.password = 'tnakamura'
        @user.password_confirmation = 'tnakamura'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include both letters and numbers')
      end
      it 'passwordが全角の場合は登録できない' do
        @user.password = 'tomoshi２０００'
        @user.password_confirmation = 'tomoshi２０００'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must include both letters and numbers')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'tomoshi1556'
        @user.password_confirmation = 'tomoshi5910'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameに全角以外を含むと登録できない' do
        @user.last_name = 'naka村'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name must be full-width characters')
      end
      it 'first_nameに全角以外を含むと登録できない' do
        @user.first_name = 'tomo思'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name must be full-width characters')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaに全角カタカナ以外を含むと登録できない' do
        @user.last_name_kana = 'ナカムら'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana must be full-width katakana characters')
      end
      it 'first_name_kanaに全角カタカナ以外を含むと登録できない' do
        @user.first_name_kana = 'トモし'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana must be full-width katakana characters')
      end
      it 'date_of_birthが空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end
