require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録がうまくいくとき" do
      it "nicknameとemail、passwordとpasswordconfirmation、
      last_name、first_name、last_name_kana、first_name_kana、birthday
      が存在すれば登録できる" do
        
      end
      it "passwordが6文字以上かつ英数字混合の場合のみ登録できる" do
        
      end
    end

    context "新規登録がうまくいかないとき"
      it "nicknameが空だと登録できない" do
        
      end
      it "emailが空では登録できない" do
        
      end
      it "emailは@がなければ登録できない" do
        
      end
      it "重複したemailが存在する場合登録できない" do
        
      end

      it "passwordが空では登録できない" do
        
      end

      it "passwordが5文字以下であれば登録できない" do
        
      end

      it "passwordが半角英数混合でなければ登録できない" do
        
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        
      end
      it "passwordとpassword_confirmationが一致しなければ登録できない" do
        
      end
      
      it "last_nameが空では登録できない" do

      end 
      it "last_nameが全角でなければ登録できない" do
        
      end
      it "first_nameが空では登録できない" do
        
      end
      it "first_nameが全角でなければ登録できない" do
        
      end

      it "last_name_kanaが空では登録できない" do
        
      end
      it "last_name_kanaが全角カナでなければ登録できない" do
        
      end
      it "first_name_kanaが空では登録できない" do
        
      end
      it "first_name_kanaが全角カナでなければ登録できない" do
        
      end
      it "birthdayが空では登録できない" do
        
      end
    end
  end
end