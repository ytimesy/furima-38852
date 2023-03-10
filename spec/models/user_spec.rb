require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "email、passwordとpassword_confirmation,nickname,firstname,lastname,firstname_kana,lastname_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが半角英数を含まない" do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it "passwordが英字のみでは登録できない" do
        @user.password = 'abcdefg'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it "passwordが全角だと登録できない" do
        @user.password = 'パスワードだ'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '123aa'
        @user.password_confirmation = '123aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password =  Faker::Internet.password(min_length: 129)
        @user.password_confirmation =  @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123aaa'
        @user.password_confirmation = '123aaa7'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'firstnameが空では登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it 'firstnameが半角文字が含まれている場合は登録できない' do
        @user.firstname = '山田tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid. Input full-width characters")
      end

      it 'lastnameが空では登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end

      it 'lastnameが半角文字が含まれている場合は登録できない' do
        @user.lastname = 'タロu'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname is invalid. Input full-width characters")
      end

      it 'firstname_kanaが空では登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end

      it 'firstname_kanaが半角文字が含まれている場合は登録できない' do
        @user.firstname_kana = 'タrou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana is invalid. Input full-width katakana characters")
      end

      it 'lastname_kanaが空では登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end

      it 'lastname_kanaが半角文字が含まれている場合は登録できない' do
        @user.lastname_kana = 'タrou'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana is invalid. Input full-width katakana characters")
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
