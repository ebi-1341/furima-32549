require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品がうまくいくとき' do
    it "name、price、description、image、category_id、condition_id、burden_id、region_id、day_idが
    存在すれば出品することができる" do
      expect(@item).to be_valid
    end
  end

  describe '商品の出品がうまくいかないとき' do
    it 'imageが空であれば出品できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空であれば出品できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'descriptionが空であれば出品できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'priceが空であれば出品できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが半角数字でなければ出品できないこと' do
      @item.price = '４００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 半角数字を入力してください')
    end
    it 'priceが300以下の数字では出品できないこと' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 金額は¥300から¥9,999,999までです')
    end
    it 'priceが9,999,999以上の数字では出品できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 金額は¥300から¥9,999,999までです')
    end
    it 'priceが半角英数混合では登録できないこと' do
      @item.price = '200test'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price 半角数字を入力してください")
    end
    it 'category_idが1(選択なし)では出品できないこと' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end
    it 'condition_idが1(選択なし)では出品できないこと' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 1')
    end
    it 'burden_idが1(選択なし)では出品できないこと' do
      @item.burden_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Burden must be other than 1')
    end
    it 'region_idが1(選択なし)では出品できないこと' do
      @item.region_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Region must be other than 1')
    end
    it 'day_idが1(選択なし)では出品できないこと' do
      @item.day_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Day must be other than 1')
    end
  end
end
