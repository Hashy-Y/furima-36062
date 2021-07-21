require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、password、password_confirmation、first_name、last_name, first_name_kana, last_name_kanaとbirthdayが存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できること' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a12345'
        expect(@user).to be_valid
      end
    end

    context '新規登録できるとき' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailには＠を含む必要があること' do
        @user.email = 'a.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
        @user.password = '1234a'
        @user.password_confirmation = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordは半角数字のみでは登録できないこと' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordは半角英字のみでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordは全角では登録できないこと' do
        @user.password = 'ａａａ１１１'
        @user.password_confirmation = 'ａａａ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456a'
        @user.password_confirmation = '123456b'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'first_nameが空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameは全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
        @user.first_name = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'last_nameは全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
        @user.last_name = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'last_name_kanaが空では登録できないこと' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'first_name_kanaは全角（カタカナ）でないと登録できないこと' do
        @user.first_name_kana = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it 'last_name_kanaは全角（カタカナ）でないと登録できないこと' do
        @user.last_name_kana = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it 'first_name_kanaは半角（カタカナ）では登録できないこと' do
        @user.first_name_kana = "ｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it 'last_name_kanaは半角（カタカナ）では登録できないこと' do
        @user.last_name_kana = "ｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it 'birthdayが空では登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end



  end
end