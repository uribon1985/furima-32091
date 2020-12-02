require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemailとpasswordとfirst_nameとfirst_name_kanaとlast_nameとlast_name_kanaとbirthdayが存在していれば保存できること' do
      expect(@user).to be_valid
    end

    it "nicknameが必須であること"do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが必須であること"do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが必須であること"do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordは、6文字以上での入力が必須であること"do
      @user.password = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "emailが一意性であること"do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "ユーザーの本名は、名字が必須であること"do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "ユーザーの本名は、名前が必須であること"do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "ユーザー本名のフリガナは、名字が必須であること"do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "ユーザー本名のフリガナは、名前が必須であること"do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "生年月日が必須であること"do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること"do
      @user.first_name = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end

    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること"do
      @user.first_name_kana = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること"do
      @user.last_name = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end

    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること"do
      @user.last_name_kana = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
    end
  
    it "メールアドレスは、@を含む必要があること"do
      @user.email = "1a.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "パスワードとパスワード（確認用）、値の一致が必須であること"do
      @user.password = "123123"
      @user.password_confirmation  = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "パスワードは、半角英数字混合での入力が必須であること"do
      @user.password = "A１１１１１１"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字混合で入力してください")
    end

    it "パスワードは半角数字のみでは登録できないこと"do
      @user.password = "1111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字混合で入力してください")
    end

    it "パスワードは半角英字のみでは登録できないこと"do
      @user.password = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字混合で入力してください")
    end

    it "passwordが全角では登録できないこと"do
      @user.password = "TESTTEST１"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 半角英数字混合で入力してください")
    end
  end
end