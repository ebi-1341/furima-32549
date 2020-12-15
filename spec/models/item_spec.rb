require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品の出品がうまくいくとき" do
    it "name、price、description、image、category_id、condition_id、burden_id、region_id、day_idが
    存在すれば出品することができる" do
      
    end
    it "priceの数値が300から9,999,999の間でのみ登録することができる" do
      
    end
  end

  describe "商品の出品がうまくいかないとき" do
    it "imageが空であれば出品できないこと" do
      
    end
    it "nameが空であれば出品できないこと" do
      
    end
    it "descriptionが空であれば出品できないこと" do
      
    end
    it "priceが空であれば出品できないこと" do
      
    end
    it "priceが半角数字でなければ出品できないこと" do
      
    end
    it "priceが300から9,999,999の間の数値以外では出品できないこと" do
      
    end
    it "category_idが1(選択なし)では出品できないこと" do
      
    end
    it "condition_idが1(選択なし)では出品できないこと" do
      
    end
    it "burden_idが1(選択なし)では出品できないこと" do
      
    end
    it "region_idが1(選択なし)では出品できないこと" do
      
    end
    it "day_idが1(選択なし)では出品できないこと" do
      
    end
  end
end