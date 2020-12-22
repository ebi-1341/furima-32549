require 'rails_helper'


describe BuyItem do
    before do
      @buy_item = FactoryBot.build(:buy_item)
    end

    describe '商品の購入がうまく保存されるとき' do
      it 'postcode、region_id、city_name、house_number、phone_numberが正しく入力されているとき' do
        expect(@buy_item).to be_valid
      end
    end

    describe '商品の購入がうまく保存されないとき' do
      it 'postcodeが空では保存されないこと' do
        @buy_item.postcode = nil
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeに半角ハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_item.postcode = 3333333
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Postcode is invalid. Include hyphen(-)")
      end
      it 'region_idが空(選択なし)では保存できないこと' do
        @buy_item.region_id = 1
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Region must be other than 1")
      end
      it 'city_nameが空では保存できないこと' do
        @buy_item.city_name = nil
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("City name can't be blank")
      end
      it 'house_numberが空では保存できないこと' do
        @buy_item.house_number = nil
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では保存できないこと' do
        @buy_item.phone_number = nil
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁か11桁の数字でないと保存できないこと' do
        @buy_item.phone_number = 111111111
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Phone number 10桁か11桁の数字を入力してください")
      end
      it 'phone_numberが10桁か11桁の数字でないと保存できないこと' do
        @buy_item.phone_number = 222333344445
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Phone number 10桁か11桁の数字を入力してください")
      end

    end

end
